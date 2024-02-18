package models;

public class Status {
	private Integer statusId;
	private String status;

	public static final int ACTIVE = 1;
	public static final int INACTIVE = 2;
	public static final int BLOCKED = 3;
	public static final int AVAILABLE = 4;
	public static final int UNAVAILABLE = 5;
	public static final int ORDERED = 6;
	public static final int UNORDERED = 7;
	public static final int DELIVERED = 8;
	public static final int UNDELIVERED = 9;
	public static final int CANCELLED = 10;

	public static final Status STATUS_ACTIVE = new Status(1);
	
	public Status() {
		super();
	}

	public Status(Integer statusId) {
		super();
		this.statusId = statusId;
	}
	
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}