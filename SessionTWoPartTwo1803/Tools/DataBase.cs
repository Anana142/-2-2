using SessionTWoPartTwo1803.DataBaseFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionTWoPartTwo1803.Tools
{
    internal class DataBase
    {
        private static TestDataBaseContext instance;

        public DataBase()
        {

        }

        public static TestDataBaseContext Instance { get
            {
            if(instance == null)
                    instance = new TestDataBaseContext();
            return instance;
            } }
    }
}
