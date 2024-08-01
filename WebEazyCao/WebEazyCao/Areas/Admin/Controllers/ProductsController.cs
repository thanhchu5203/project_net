using ClosedXML.Excel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Mono.TextTemplating;
using SkiaSharp;
using System.Drawing.Printing;
using WebEazyCao.FIlter;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductsController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();

        // GET: Admin/Products
        [Route("Admin/Products")]
        public async Task<IActionResult> Index(string SearchString, int? page, int? pageSize)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            //return View(await db.Products.OrderByDescending(p => p.Id).Include(p => p.Category).Include(p => p.Brand).ToListAsync());
            var products = db.Products
         .Include(p => p.Category)
         .Include(p => p.Brand)
         .Where(p => p.IsDelete == false)
         .AsQueryable();

            if (!String.IsNullOrEmpty(SearchString))
            {
                products = products.Where(p => p.Name.Contains(SearchString));
            }
            var defaultPageSize = 5; // Số sản phẩm mặc định trên mỗi trang
            var actualPageSize = pageSize ?? defaultPageSize;//Số sản phẩm thực tế trên mỗi trang, nếu pageSize không được cung cấp thì sử dụng defaultPageSize.
            var pageIndex = page ?? 1;
            var totalProducts = await products.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalProducts / actualPageSize);
            var start = (pageIndex - 1) * actualPageSize;

            var paginatedProducts = await products
                .OrderByDescending(p => p.Id)
                .Skip(start)
                .Take(actualPageSize)
                .ToListAsync();

            ViewBag.CurrentPage = pageIndex;
            ViewBag.TotalPages = totalPages;
            ViewBag.SearchString = SearchString;
            ViewBag.PageSize = actualPageSize;

            return View(paginatedProducts);
        }
        private List<SelectListItem> GetCategory()
        {
            // Fetch categories from the database
            var categories = db.Categories
                                     .Where(c => !c.IsDelete.HasValue || !c.IsDelete.Value)
                                     .ToList();

            // Map to SelectListItem
            return categories.Select(c => new SelectListItem
            {
                Value = c.Id.ToString(),
                Text = c.Name
            }).ToList();
        }
        private List<SelectListItem> GetBrand()
        {
            // Fetch brands from the database, excluding those marked as deleted
            var brands = db.Brands
                           .Where(b => !b.IsDelete.HasValue || !b.IsDelete.Value)
                           .ToList();

            // Map to SelectListItem
            return brands.Select(b => new SelectListItem
            {
                Value = b.Id.ToString(),
                Text = b.Name
            }).ToList();
        }


        [Route("Admin/Products/AddProduct")]
        public IActionResult AddProduct()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }

            // Lấy danh sách CategoryId và truyền vào ViewBag
            var categories = GetCategory();
            ViewBag.CategoryId = new SelectList(categories, "Value", "Text");

            // Lấy danh sách BrandId và truyền vào ViewBag
            var brands = GetBrand();
            ViewBag.BrandId = new SelectList(brands, "Value", "Text");

            return View();
        }


        [HttpPost]
        [Route("Admin/Products/AddProduct")]
        public IActionResult AddProduct(Product model)
        {
            if (ModelState.IsValid)
            {
                model.Price = model.Price / 1000;
                Product p = new Product()
                {
                    Name = model.Name,
                    Image = model.Image,
                    CategoryId = model.CategoryId,
                    BrandId = model.BrandId,
                    Price = model.Price,
                    Description = model.Description,
                    Quantity = 0, // Thiết lập số lượng ban đầu là 0
                    CreatedBy = "admin",
                    CreatedAt = DateTime.Now,
                    IsDelete = false,
                };

                // Lấy toàn bộ danh sách sản phẩm và kiểm tra trong mã C#
                var check = db.Products.FirstOrDefault(x => x.Name == model.Name && x.IsDelete == false);
                if (check == null)
                {
                    db.Products.Add(p);
                    db.SaveChanges();
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên sản phẩm đã tồn tại.");
                    ViewBag.CategoryId = new SelectList(GetCategory(), "Value", "Text", model.CategoryId);
                    ViewBag.BrandId = new SelectList(GetBrand(), "Value", "Text", model.BrandId);
                    return View(model);
                }
                return RedirectToAction("Index", "Products", new { area = "Admin" });
            }

            return View(model);
        }



        [HttpPost]
        public IActionResult DeleteProduct(int id)
        {
            var product = db.Products.Include(p => p.ProductDetails).FirstOrDefault(p => p.Id == id);
            if (product != null)
            {
                // Cập nhật trạng thái IsDelete thay vì xóa
                product.IsDelete = true;
                product.DeletedAt = DateTime.Now;
                product.DeletedBy = "admin";
                foreach (var detail in product.ProductDetails)
                {
                    detail.IsDelete = true; // Đánh dấu xóa tất cả chi tiết sản phẩm liên quan
                }
                db.SaveChanges();
                return Json(new { success = true, message = "Xóa sản phẩm thành công!" });
            }
            return Json(new { success = false, message = "Sản phẩm không tồn tại." });
        }

        [HttpGet]
        [Route("Admin/Products/EditProduct/{id?}")]
        public IActionResult EditProduct(int? id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            if (id == null)
            {
                return NotFound();
            }
            var product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories.Where(c => !c.IsDelete.HasValue || !c.IsDelete.Value).ToList(), "Id", "Name");
            ViewBag.BrandId = new SelectList(GetBrand(), "Value", "Text"); // Use GetBrand() to filter out deleted brands
            return View(product);
        }


        [HttpPost]
        public async Task<IActionResult> EditProduct(Product model)
        {
            if (ModelState.IsValid)
            {
                var product = await db.Products.FindAsync(model.Id);
                if (product == null)
                {
                    return NotFound();
                }

                var check = db.Products.FirstOrDefault(x => x.Name == model.Name && x.Id != model.Id && x.IsDelete == false);
                if (check != null)
                {
                    ModelState.AddModelError("Name", "Tên sản phẩm đã tồn tại.");
                    ViewBag.CategoryId = new SelectList(GetCategory(), "Value", "Text", model.CategoryId);
                    ViewBag.BrandId = new SelectList(GetBrand(), "Value", "Text", model.BrandId);
                    return View(model);
                }

                product.Name = model.Name;
                product.Image = model.Image;
                product.CategoryId = model.CategoryId;
                product.BrandId = model.BrandId;
                product.Price = model.Price;
                product.Description = model.Description;
                product.UpdatedBy = "admin";
                product.UpdatedAt = DateTime.Now;

                db.Update(product);
                await db.SaveChangesAsync();

                return RedirectToAction("Index", "Products", new { area = "Admin" });
            }
            ViewBag.CategoryId = new SelectList(GetCategory(), "Value", "Text", model.CategoryId);
            ViewBag.BrandId = new SelectList(GetBrand(), "Value", "Text", model.BrandId);
            return View(model);
        }


        [HttpPost]
        public IActionResult DeleteAllSelect(int[] ids)
        {
            var productsToDelete = db.Products.Include(p => p.ProductDetails).Where(p => ids.Contains(p.Id)).ToList();
            if (productsToDelete.Count > 0)
            {
                foreach (var product in productsToDelete)
                {
                    product.IsDelete = true; // Đánh dấu xóa sản phẩm
                    product.DeletedBy = "admin";
                    product.DeletedAt = DateTime.Now;
                    foreach (var detail in product.ProductDetails)
                    {
                        detail.IsDelete = true; // Đánh dấu xóa chi tiết sản phẩm liên quan
                    }
                }
                db.SaveChanges();
                return Json(new { success = true, message = "Xóa sản phẩm thành công!" });
            }
            return Json(new { success = false, message = "Không tìm thấy sản phẩm để xóa." });
        }

        // GET: Admin/ProductDetails/{id}
        [Route("Admin/ProductDetails/{id?}")]
        public async Task<IActionResult> ProductDetails(int? id, string filter)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var productDetailsQuery = db.ProductDetails.AsQueryable();

            if (id.HasValue)
            {
                productDetailsQuery = productDetailsQuery.Where(pd => pd.ProductId == id.Value);
            }

            if (filter == "sold")
            {
                productDetailsQuery = productDetailsQuery.Where(pd => pd.IsDelete);
            }
            else if (filter == "not-sold")
            {
                productDetailsQuery = productDetailsQuery.Where(pd => !pd.IsDelete);
            }
            var productDetails = await productDetailsQuery
                .Where(pd => (!id.HasValue || pd.ProductId == id.Value)) // Lọc ra chi tiết sản phẩm không bị đánh dấu xóa
                .OrderByDescending(p => p.Id)
                .OrderByDescending(p => p.Id)
                .Include(p => p.Product)
                .ToListAsync();

            var categoryId = db.Products.Where(p => p.Id == id).Select(p => p.CategoryId).FirstOrDefault();
            ViewBag.ProductId = id;
            ViewBag.CategoryId = categoryId;
            ViewBag.CurrentFilter = filter;
            return View(productDetails);
        }

        [Route("Admin/ProductDetails/AddProductDetail")]
        public IActionResult AddProductDetail(int productId)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            ViewBag.ProductId = productId;
            return View();
        }

        [HttpPost]
        [Route("Admin/ProductDetails/AddProductDetail")]
        public IActionResult AddProductDetail(ProductDetail model)
        {
            if (ModelState.IsValid)
            {
                var check = db.ProductDetails.FirstOrDefault(x => x.Serial == model.Serial && x.IsDelete == false);
                if (check == null)
                {
                    ProductDetail p = new ProductDetail()
                    {
                        Serial = model.Serial,
                        Code = model.Code,
                        ProductId = model.ProductId,
                        IsDelete = false,
                    };

                    db.ProductDetails.Add(p);
                    var product = db.Products.FirstOrDefault(p => p.Id == model.ProductId);
                    if (product != null)
                    {
                        product.Quantity += 1;
                    }
                    db.SaveChanges();

                    return RedirectToAction("ProductDetails", new { id = model.ProductId });
                }
                else
                {
                    ModelState.AddModelError("Serial", "Serial đã tồn tại.");
                    ViewBag.ProductId = model.ProductId; // Truyền lại ProductId để hiển thị trong View
                    return View(model);
                }
            }
            ViewBag.ProductId = model.ProductId; // Truyền lại ProductId để hiển thị trong View
            return View(model);
        }

        [HttpPost]
        public IActionResult DeleteProductDetails(int id, int productId)
        {
            var productDetail = db.ProductDetails.FirstOrDefault(p => p.Id == id);
            if (productDetail != null)
            {
                if (productDetail.IsDelete)
                {
                    return Json(new { success = false, message = "Không thể xóa sản phẩm đã bán." });
                }

                // Nếu chưa bán, tiến hành xóa
                db.ProductDetails.Remove(productDetail);
                var product = db.Products.FirstOrDefault(prod => prod.Id == productDetail.ProductId);
                if (product != null && product.Quantity > 0)
                {
                    product.Quantity -= 1;
                }

                db.SaveChanges();
                return Json(new { success = true, message = "Xóa chi tiết sản phẩm thành công!" });
            }
            return Json(new { success = false, message = "Chi tiết sản phẩm không tồn tại." });
        }

        [HttpGet]
        [Route("Admin/ProductDetails/EditProductDetail/{id?}")]
        public IActionResult EditProductDetail(int? id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            if (id == null)
            {
                return NotFound();
            }
            var productDetail = db.ProductDetails.Find(id);
            if (productDetail == null)
            {
                return NotFound();
            }
            return View(productDetail);
        }

        [HttpPost]
        [Route("Admin/ProductDetails/EditProductDetail")]
        public IActionResult EditProductDetail(ProductDetail model)
        {
            if (ModelState.IsValid)
            {
                var productDetail = db.ProductDetails.Find(model.Id);
                if (productDetail == null)
                {
                    return NotFound();
                }

                var check = db.ProductDetails.FirstOrDefault(x => x.Serial == model.Serial && x.Id != model.Id && x.IsDelete == false);
                if (check != null)
                {
                    ModelState.AddModelError("Serial", "Serial đã tồn tại.");
                    return View(model);
                }

                productDetail.Serial = model.Serial;
                productDetail.Code = model.Code;
                productDetail.ProductId = model.ProductId;

                db.SaveChanges();
                return RedirectToAction("ProductDetails", new { id = model.ProductId });
            }
            return View(model);
        }

        [HttpPost]
        public IActionResult DeleteSelected(int[] ids)
        {
            var productDetails = db.ProductDetails.Where(pd => ids.Contains(pd.Id)).ToList();
            // Giảm số lượng sản phẩm tương ứng
            if (productDetails.Count > 0)
            {
                var productIds = productDetails.Select(pd => pd.ProductId).Distinct().ToList();
                var products = db.Products.Where(p => productIds.Contains(p.Id)).ToList();

                // Xóa chi tiết sản phẩm khỏi cơ sở dữ liệu
                db.ProductDetails.RemoveRange(productDetails);
                foreach (var productDetail in productDetails)
                {
                    if (productDetail.IsDelete)
                    {
                        return Json(new { success = false, message = "Không thể xóa sản phẩm đã bán." });
                    }
                    var product = db.Products.FirstOrDefault(p => p.Id == productDetail.ProductId);
                    //if (product != null && product.Quantity > 0)
                    if (product.Quantity > 0)
                    {
                        product.Quantity -= 1;
                    }
                }
                //foreach (var detail in productDetails)
                //{
                //    detail.IsDelete = true; // Đánh dấu xóa chi tiết sản phẩm
                //}
                db.SaveChanges();
                return Json(new { success = true, message = "Các mục đã được xóa thành công!" });
            }
            return Json(new { success = false, message = "Không tìm thấy các mục đã chọn." });
        }
        [HttpGet]
        public async Task<IActionResult> ExportProductToExcel()
        {
            try
            {
                var products = await db.Products
                    .Include(b => b.Brand)
                    .Include(c => c.Category)
                    .ToListAsync();
                using (var workBook = new XLWorkbook())
                {
                    var workSheet = workBook.Worksheets.Add("Products");

                    workSheet.Cell(1, 1).Value = "Id";
                    workSheet.Cell(1, 2).Value = "Name";
                    workSheet.Cell(1, 3).Value = "Description";
                    workSheet.Cell(1, 4).Value = "Price";
                    workSheet.Cell(1, 5).Value = "Quantity";
                    workSheet.Cell(1, 6).Value = "Brand";
                    workSheet.Cell(1, 7).Value = "Category";

                    for (int i = 0; i < products.Count(); i++)
                    {
                        workSheet.Cell(i + 2, 1).Value = products[i].Id;
                        workSheet.Cell(i + 2, 2).Value = products[i].Name;
                        workSheet.Cell(i + 2, 3).Value = products[i].Description;
                        workSheet.Cell(i + 2, 4).Value = products[i].Price;
                        workSheet.Cell(i + 2, 5).Value = products[i].Quantity;
                        workSheet.Cell(i + 2, 6).Value = products[i].Brand?.Name;
                        workSheet.Cell(i + 2, 7).Value = products[i].Category?.Name;
                    }

                    using (var stream = new MemoryStream())
                    {
                        workBook.SaveAs(stream);
                        var content = stream.ToArray();

                        return File(content,
                            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Products.xlsx");
                    }
                }
            }catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [Route("Products/ImportProductFromExcel")]
        [HttpPost]
        public async Task<IActionResult> ImportProductFromExcel(IFormFile file)
        {
            try
            {
                if(file == null || file.Length <= 0)
                {
                    return BadRequest("File not selected.");
                }
                using(var stream = new MemoryStream())
                {
                    await file.CopyToAsync(stream);

                    using ( var workBook = new XLWorkbook(stream))
                    {
                        var workSheet = workBook.Worksheet(1);
                        var rows = workSheet.RowsUsed().Skip(1);
                        var products = new List<Product>();
                        var productDb = db.Products.ToList();
                        foreach (var row in rows)
                        {
                            var name = row.Cell(1).Value.ToString();
                            foreach (var item in productDb)
                            {
                                if (item.Name.Equals(name))
                                {
                                    ModelState.AddModelError("", "Sản phẩm đã tồn tại");
                                    return Redirect("/admin/products/addproduct");
                                }
                            }
                            var description = row.Cell(2).Value.ToString();
                            var price = Convert.ToDecimal(row.Cell(3).Value.ToString());
                            var quantity = Convert.ToInt32(row.Cell(4).Value.ToString());
                            var brandName = row.Cell(5).Value.ToString();
                            var categoryName = row.Cell(6).Value.ToString();

                            var brandId = GetBrandName(brandName);
                            var categoryId = GetCategoryName(categoryName);
                            var product = new Product
                            {
                                Name = name,
                                Description = description,
                                Price = price,
                                Quantity = quantity,
                                BrandId = brandId,
                                CategoryId = categoryId,
                                IsDelete = false
                            };
                            products.Add(product);
                        }
                        db.Products.AddRange(products);
                        await db.SaveChangesAsync();
                        return Redirect("/Admin/Products");
                    }
                }
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        private int GetBrandName(string name)
        {
            var existingBrand = db.Brands.FirstOrDefault(b => b.Name == name);
            if(existingBrand != null)
            {
                return existingBrand.Id;
            }
            var newBrand = new Brand { Name = name };
            db.Brands.Add(newBrand);
            db.SaveChanges();
            return newBrand.Id;
        } 
        private int GetCategoryName(string name)
        {
            var existingCategory = db.Categories.FirstOrDefault(b => b.Name == name);
            if(existingCategory != null)
            {
                return existingCategory.Id;
            }
            var newCategory = new Category { Name = name };
            db.Categories.Add(newCategory);
            db.SaveChanges();
            return newCategory.Id;
        }
    }
}
