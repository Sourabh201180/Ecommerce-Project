package models;

public class Address {
    private Integer addressId;
    private String lane1;
    private String lane2;
    private Integer postalCode;  
    private String landMark;
    private City city;
    private User user;
    private AddressType addressType;

    public Address() {
        
    }

    public Integer getAddressId() {
        return addressId;
    }
    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }
    public String getLane1() {
        return lane1;
    }
    public void setLane1(String lane1) {
        this.lane1 = lane1;
    }
    public String getLane2() {
        return lane2;
    }
    public void setLane2(String lane2) {
        this.lane2 = lane2;
    }
    public Integer getPostalCode() {
        return postalCode;
    }
    public void setPostalCode(Integer postalCode) {
        this.postalCode = postalCode;
    }
    public String getLandMark() {
        return landMark;
    }
    public void setLandMark(String landMark) {
        this.landMark = landMark;
    }
    public City getCity() {
        return city;
    }
    public void setCity(City city) {
        this.city = city;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public AddressType getAddressType() {
        return addressType;
    }
    public void setAddressType(AddressType addressType) {
        this.addressType = addressType;
    } 
}