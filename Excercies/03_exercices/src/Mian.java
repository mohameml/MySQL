import java.sql.*;

public class Mian {

    public static void  affichageRes(ResultSet res) throws SQLException
    {

        while(res.next())
        {
            String emailString = res.getString("Email");
            String  nom = res.getString("NOM");
            String  prenom = res.getString("NOM");
            String password = res.getString("motpasse");

            // affichage :
            System.out.println("l'utilisateur : nom = "+nom+" prénom = "+prenom+" de mial :"+emailString);
        }
    }

    public static void main(String[] args) {
        

        try {
            
            Connection conncetion = DriverManager.getConnection("gdbc:sqlite:db.sqlite");

            PreparedStatement stmt = conncetion.prepareStatement("SELECT * FROM comptes");


            ResultSet res = stmt.executeQuery();

            affichageRes(res);


            conncetion.close();





        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}