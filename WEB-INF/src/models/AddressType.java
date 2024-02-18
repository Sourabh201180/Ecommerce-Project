package models;

public class AddressType {
    private Integer addressTypeId;
    private String type;

    public AddressType() {
    }

    public Integer getAddressTypeId() {
        return addressTypeId;
    }
    public void setAddressTypeId(Integer addressTypeId) {
        this.addressTypeId = addressTypeId;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }   
}