using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Learning_App
{
    public partial class Default : System.Web.UI.Page
    {
        protected List<IStateCountry> l;

        protected void Page_Load(object sender, EventArgs e)
        {
            db d = new db();
            l = d.getStateList(d.cn());
            
        }
    }
    public class db
    {
        public SqlConnection cn(){
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["test"].ConnectionString);
            cn.Open();
            return cn;
        }
        public List<IStateCountry> getStateList(SqlConnection cn)
        {
            List<IStateCountry> l = new List<IStateCountry>();
            SqlCommand cmd = new SqlCommand("select c.Abbr, s.Name from Country c join State s on s.fkCountry = c.ID", cn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                IStateCountry SC = new IStateCountry();
                SC.State = rd["Name"].ToString();
                SC.ContryAbbr = rd["Abbr"].ToString();
                l.Add(SC);
            }
            return l;
        }
    }
    public class IStateCountry
    {
        public string State;
        public string ContryAbbr;
    }

    public class basec
    {
        public string baseName;
    }

    public class childc : basec
    {
        public string childName;
    }
}