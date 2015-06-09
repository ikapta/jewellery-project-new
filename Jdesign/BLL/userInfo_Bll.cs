using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
    public class userInfo_Bll
    {
        userInfo_Model muser = new userInfo_Model();
        userInfo_Dal duser = new userInfo_Dal();

        public int userLogin(string userName, string passWord)
        {
            if (userName == "")
            {
                return -1;
            }

            int res = duser.userLogin(userName, passWord);
            return res;
        }

    }

}
