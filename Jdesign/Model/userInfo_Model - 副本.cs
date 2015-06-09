using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Model
{
    public class userInfo_Model
    {
        private string userName, passWord, sex, date;
        private int isexist;

        public int Isexist
        {
            get { return isexist; }
            set { isexist = value; }
        }


        public string Date
        {
            get { return date; }
            set { date = value; }
        }

        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        public string PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

    }
}
