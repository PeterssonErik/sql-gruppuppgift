using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void something (string paramName)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Context Connection=true";

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        conn.Open();
        cmd.CommandText = "SELECT * FROM player WHERE player.playerName LIKE @paramName + '%'";
        SqlParameter param = new SqlParameter();
        param.Value = paramName;
        param.Direction = ParameterDirection.Input;
        param.DbType = DbType.String;
        param.ParameterName = "@paramName";

        cmd.Parameters.Add(param);
        SqlDataReader sqldr = cmd.ExecuteReader();
        SqlContext.Pipe.Send(sqldr);
        sqldr.Close();
        conn.Close();
    }
}
