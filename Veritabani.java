package otel.database;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import otel.users.Musteri;

/**
 * projenin veritabanı işlemlerini yapan sınıf
 * 
 * @author busra
 * @author ilayda
 */
public class Veritabani {
    
    //bağlantı nesnemiz
    Connection connection;
    
    /**
     * kurucu metodumuz sınıf çağrılınca çalışır
     */
    public Veritabani(){
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //sql server bağlantı metni
            connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=otel","local","123");//veritabanımızın olduğu adres
            
        } 
        catch(ClassNotFoundException c){
            c.printStackTrace();
        }
        catch (SQLException ex) {
           ex.printStackTrace();
        }
          
    }
    
    /**
     * Veritabanına öüşteri kaydeder
     * 
     * @param m Müsteri nesnesi
     * @throws SQLException 
     */
    public void musteriKaydet(Musteri m) throws SQLException{
        
        PreparedStatement query = connection.prepareStatement("INSERT INTO Musteriler(ad,soyad,yas,tc_kimlik,telefon,meslek,sifre,userID) VALUES("
                + "'"+m.getAd()+"','"+m.getSoyad()+"',"+m.getYas()+",'"+m.getTcNo()+"','"+m.getTelefon()+"','"+m.getMeslek()+"','"+m.getSifre()+"','"+m.getKullaniciAdi()+"')");
        
        
        query.executeUpdate();
        
          
    }
    
    /**
     * Giriş yap metodu hesap var ise true döner
     * 
     * @param user kullanıcı adı
     * @param sifre şifre
     * @return true veya false
     * @throws SQLException 
     */
    public boolean girisYap(String user,String sifre) throws SQLException{
        
        PreparedStatement query = connection.prepareStatement("SELECT * FROM Musteriler WHERE userID='"+user+"' AND sifre ='"+sifre+"'");
        
       ResultSet rs = query.executeQuery();
       
       if(rs.next()){
           return true;
       }
       else
           return false;
        
    }
    
    /**
     * 
     * @param resim otel resmi
     * @param otelAdi otelin adı
     * @param adres otelin adresi
     * @param yildiz otelin yıldızi
     * @param id otelin Id si
     */
    public void otelOlustur(JLabel resim,JLabel otelAdi,JLabel adres,JLabel yildiz,int id){
        
        PreparedStatement query;
        try {
            query = connection.prepareStatement("SELECT * FROM Oteller WHERE id = "+id);
              ResultSet rs = query.executeQuery();
        
        if(rs.next()){
            
            ImageIcon img = new ImageIcon("src/resources/otel_images/"+rs.getString("resim"));
            Image icon = img.getImage().getScaledInstance(resim.getWidth(),resim.getHeight(),Image.SCALE_DEFAULT);
            resim.setIcon(new ImageIcon(icon));
            
            otelAdi.setText(rs.getString("otel_adi"));
            adres.setText(rs.getString("adres"));
            ImageIcon star = new ImageIcon("src\\resources\\otel_images\\star"+rs.getInt("yildiz")+".png");
            Image image = star.getImage().getScaledInstance(yildiz.getWidth(), yildiz.getHeight(), Image.SCALE_DEFAULT);
            yildiz.setIcon(new ImageIcon(image));
          
        
            
        }
        
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
      
        
        
    }
    
    
   /**
    * 
    * @param id otel id si
    * @return boş odaları liste şeklinde döndürür
    */
    public ArrayList getOdalar(int id){
        
        ArrayList boslar = new ArrayList();
        try {
            PreparedStatement query = connection.prepareStatement("SELECT oda_numarasi FROM Odalar WHERE otel_ID="+id);
            
            ResultSet rs = query.executeQuery();
            ArrayList list = new ArrayList();
            while(rs.next()){
                
                list.add(rs.getInt("oda_numarasi"));
            }
                
            for (int i = 1; i <= 20; i++) {
                
                if (!list.contains(i)) {
                    if (i==1) {
                        boslar.add(i+"-Kral Dairesi");
                    }else
                    boslar.add(i);
                }
            }
     
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
                
         return boslar;
        
    }
    
    /**
     *  rezervasyon yapma metodu
     * @param otel otel id
     * @param musteri musteri id
     * @param tip oda tipi
     * @param fiyat oda fiyatı 
     * @param toplam başlangıçta oda fiyatı ile aynı 
     * @param oda oda numarası
     * @param giris giriş tarihi
     * @param cikis çıkış tarihi
     */
    public void rezervasyonYap(int otel,int musteri,String tip,int fiyat,int toplam,int oda,String giris,String cikis){
        
try {
 PreparedStatement st = connection.prepareStatement("INSERT INTO Odalar(otel_ID,musteri_ID,oda_tipi,fiyati,toplam_ucret,oda_numarasi,dolumu,baslangicTarihi,bitis) VALUES("+otel+","+musteri+",'"+tip+"',"+fiyat+","+toplam+","+oda+",1,'"+giris+"','"+cikis+"')");
     st.execute();
 
 
   } catch (SQLException ex) {
            ex.printStackTrace();
    }
        
    }
    
    
    /**
     * 
     * @param id otel id
     * @return otelin adını döner
     */
    public String getOtelAd(int id){
        
        try {
            PreparedStatement s = connection.prepareStatement("SELECT otel_adi FROM Oteller where id="+id);
           ResultSet set =  s.executeQuery();
           set.next();
           return set.getString("otel_adi");
           
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
        
    }
    
    /**
     * Müşterinin adını ve soyadını döne metod
     * @param query sql komutu
     * @param adKolon adın olduğu kolon adı
     * @param soyadKolon soyadın olduğu kolon adı
     * @return müşterinin adını ve soyadını döner
     */
    public String getAdSoyad(String query,String adKolon,String soyadKolon){
        
        String adSoyad="";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                 adSoyad =rs.getString(adKolon)+" ";
                 adSoyad += rs.getString(soyadKolon);
            }
            return adSoyad;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    
    /**
     * Verilen komuta göre istenilen kaydın id sini döner
     * @param query SQL komutu
     * @return id
     */
    public int getID(String query){
        
          try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                 return rs.getInt("id");
                 
            }
        
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /**
     * Müşterinin otelden çıkışını gerçekleştirir ve ödenecek ücreti geri döner
     * @param musteri Müşteri nesnesi
     * @return toplam ödenecek ücret
     */
    public int cikisYap(int musteri){
        int toplam=0;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Odalar where musteri_ID="+musteri);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                 
                toplam+=rs.getInt("toplam_ucret");
            }
        
           connection.prepareStatement("DELETE FROM Odalar where musteri_ID="+musteri).execute();
           
            return toplam;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /**
     * verilen otel id sine göre otelde bulununan müşterileri listeler
     * 
     * @param m Müşteri nesnesi
     * @param id otel id si
     */
    public void MusterileriListele(DefaultTableModel m,int id){
        
          try {
            PreparedStatement ps = connection.prepareStatement("SELECT ad, soyad,otel_adi,oda_tipi, toplam_ucret, oda_numarasi, baslangicTarihi, bitis FROM Odalar INNER JOIN Oteller ON otel_ID = Oteller.id INNER JOIN Musteriler ON musteri_ID = Musteriler.id WHERE Otel_ID ="+id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                 
                Vector v = new Vector();
                v.add(rs.getString("ad"));
                v.add(rs.getString("soyad"));
                v.add(rs.getString("otel_adi"));
                v.add(rs.getString("oda_tipi"));
                v.add(rs.getInt("toplam_ucret"));
                v.add(rs.getInt("oda_numarasi"));
                v.add(rs.getDate("baslangicTarihi"));
                v.add(rs.getDate("bitis"));
                m.addRow(v);
             
                
            }
        
          
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }
    
    /**
     * seçilen müşteriye servis ücreti kadar ekleme yapar
     * @param musteri müşteri nesnesi
     * @param oda oda numarası
     * @param ucret eklenecek ücret
     */
    public void ServisEkle(int musteri,int oda,int ucret){
        
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE Odalar set toplam_fiyat+="+ucret+" where oda_numarasi="+oda+" AND musteri_ID="+musteri);
            ps.executeQuery();
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
    }
    
    
}
