package dao;

import java.util.List;

import model.Product;

public class TestProductDAO {

    public static void main(String[] args) {

        ProductDAO productDAO = new ProductDAO();

        List<Product> products = productDAO.getAllProducts();

        for (Product product : products) {

            System.out.println(
                product.getId() + " | " +
                product.getName() + " | " +
                product.getSku() + " | " +
                product.getQuantity()
            );
        }
    }
}
