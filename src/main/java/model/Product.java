package model;

public class Product {

    private int id;
    private String name;
    private String sku;
    private int categoryId;
    private int supplierId;
    private double unitPrice;
    private double costPrice;
    private int quantity;
    private int reorderLevel;
    private String description;

    public Product() {
    }

    public Product(int id, String name, String sku, int categoryId,
                   int supplierId, double unitPrice, double costPrice,
                   int quantity, int reorderLevel, String description) {

        this.id = id;
        this.name = name;
        this.sku = sku;
        this.categoryId = categoryId;
        this.supplierId = supplierId;
        this.unitPrice = unitPrice;
        this.costPrice = costPrice;
        this.quantity = quantity;
        this.reorderLevel = reorderLevel;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getReorderLevel() {
        return reorderLevel;
    }

    public void setReorderLevel(int reorderLevel) {
        this.reorderLevel = reorderLevel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
