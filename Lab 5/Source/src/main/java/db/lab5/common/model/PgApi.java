package db.lab5.common.model;

import sun.misc.Version;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PgApi {

    private static String selectQuery = "SELECT * FROM idx";
    private static String procedureQuery = "SELECT * FROM f_generate_row() AS rec(ename varchar, sal money, hiredate date, job varchar);";
    private static String updateQuery = "UPDATE idx SET sal=f_random_salary(10000, 1000), hiredate=f_random_date(1000), job=f_random_string(50) " +
            "WHERE ename = (SELECT ename FROM idx OFFSET floor(random()*(SELECT count(1) FROM idx)) LIMIT 1) RETURNING *;";

    Connection con;
    Statement st;
    ResultSet rs;

    String url, password, user;

    public PgApi() {
        url = null;
        user = null;
        password = null;

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        url = "jdbc:postgresql://localhost:5432/dblab5";
        user = "postgres";
        password = "123";
    }

    public Data[] runSelect() {
        Data[] dataArray = null;
        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery(selectQuery);
            dataArray = new Data[10];
            int i = 0 ;
            while (rs.next()) {
                dataArray[i] = new Data(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                i++;
            }
        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(Version.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(Version.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
            }
        }
        return dataArray;
    }

    public Data runUpdate() {
        Data data = null;
        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery(updateQuery);

            if (rs.next()) {
                data = new Data(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }

        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(Version.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(Version.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
            }
        }
        return data;
    }

    public Data runProcedure() {
        Data data = null;
        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery(procedureQuery);

            if (rs.next()) {
                data = new Data(rs.getString(2), rs.getString(3), rs.getString("ename"), rs.getString("job"));
            }

        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(Version.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(Version.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
            }
        }
        return data;
    }
}
