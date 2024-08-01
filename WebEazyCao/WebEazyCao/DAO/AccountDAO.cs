using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;

namespace WebEazyCao.DAO
{
    public class AccountDAO
    {
        public static List<User> GetAllAccount()
        {
            List<User> list = new List<User>();

            using (var context = new BanTheCaoContext())
            {
                list = context.Users.ToList();
            }
            return list;

        }
        public static User Login(string username, string password)
        {
            return GetAllAccount().FirstOrDefault(x => x.UserName == username && x.Password == password);
        }

        public static void Register(User user)
        {
            user.CreatedAt = DateTime.Now;
            user.CreatedBy = user.UserName;
            using (var context = new BanTheCaoContext())
            {
                var users = context.Set<User>();
                users.Add(user);
                context.SaveChanges();
            }
        }

        public static object CheckRegister(string userName, string email)
        {
            return GetAllAccount().FirstOrDefault(u => u.UserName == userName || u.Email == email);
        }

        public static User GetAccountWithId(int? id)
        {
            return GetAllAccount().FirstOrDefault(x => x.Id == id);
        }

        public static User GetAccountWithUsernameMail(string email)
        {
            return GetAllAccount().FirstOrDefault(x => x.Email == email);
        }

        public static void UpdateUser(User user)
        {
            try
            {
                user.UpdatedAt = DateTime.Now;
                User u = GetAccountWithId(user.Id);
                if (u != null)
                {
                    using (var context = new BanTheCaoContext())
                    {
                        var users = context.Set<User>();
                        users.Update(user);
                        context.SaveChanges();
                    }
                }
                else
                {
                    throw new Exception("The User does not exist");
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public static Product GetProductById(int productId)
        {
            using (var context = new BanTheCaoContext())
            {
                return context.Products
                              .Include(p => p.ProductDetails) // Include để lấy thông tin chi tiết sản phẩm
                              .FirstOrDefault(p => p.Id == productId);
            }
        }
    } 
}
