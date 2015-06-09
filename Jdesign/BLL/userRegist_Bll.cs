using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DAL;

namespace BLL
{
    public class userRegist_Bll
    {
        userInfo_Model muser = new userInfo_Model();
        userRegist_Dal duser = new userRegist_Dal();

        public int userRegist(string username, string password, string usersex, string userbirth)
        {
            muser.UserName = username;
            muser.PassWord = password;
            muser.Sex = usersex;
            muser.Date = userbirth;
            int re = duser.userRegist(muser);
            return re;
        }
    }
}
