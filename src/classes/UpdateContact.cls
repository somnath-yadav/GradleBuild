public class UpdateContact {

  public String customerID;
  public String uid;

  
  public static UpdateContact parse(String json) {
    return (UpdateContact) System.JSON.deserialize(json, UpdateContact.class);
  }
}