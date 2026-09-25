package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import util.DBconnect;

public class ProductDAO {

    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setSku(resultSet.getString("sku"));
                product.setCategoryId(resultSet.getInt("category_id"));
                product.setSupplierId(resultSet.getInt("supplier_id"));
                product.setUnitPrice(resultSet.getDouble("unit_price"));
                product.setCostPrice(resultSet.getDouble("cost_price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setReorderLevel(resultSet.getInt("reorder_level"));
                product.setDescription(resultSet.getString("description"));

                products.add(product);
            }
            

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERROR: Cannot load products.");
        }
        

        return products;
    }
    public boolean insertProduct(Product product) {

        String sql = "INSERT INTO products "
                + "(name, sku, category_id, supplier_id, unit_price, "
                + "cost_price, quantity, reorder_level, description) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getSku());
            statement.setInt(3, product.getCategoryId());
            statement.setInt(4, product.getSupplierId());
            statement.setDouble(5, product.getUnitPrice());
            statement.setDouble(6, product.getCostPrice());
            statement.setInt(7, product.getQuantity());
            statement.setInt(8, product.getReorderLevel());
            statement.setString(9, product.getDescription());

            int rowsInserted = statement.executeUpdate();

            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public Product getProductById(int id) {

        Product product = null;

        String sql = "SELECT * FROM products WHERE id = ?";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    product = new Product();

                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setSku(resultSet.getString("sku"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    product.setSupplierId(resultSet.getInt("supplier_id"));
                    product.setUnitPrice(resultSet.getDouble("unit_price"));
                    product.setCostPrice(resultSet.getDouble("cost_price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setReorderLevel(resultSet.getInt("reorder_level"));
                    product.setDescription(resultSet.getString("description"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
    public boolean updateProduct(Product product) {

        String sql = "UPDATE products SET "
                + "name = ?, "
                + "sku = ?, "
                + "category_id = ?, "
                + "supplier_id = ?, "
                + "unit_price = ?, "
                + "cost_price = ?, "
                + "quantity = ?, "
                + "reorder_level = ?, "
                + "description = ? "
                + "WHERE id = ?";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getSku());
            statement.setInt(3, product.getCategoryId());
            statement.setInt(4, product.getSupplierId());
            statement.setDouble(5, product.getUnitPrice());
            statement.setDouble(6, product.getCostPrice());
            statement.setInt(7, product.getQuantity());
            statement.setInt(8, product.getReorderLevel());
            statement.setString(9, product.getDescription());
            statement.setInt(10, product.getId());

            int rowsUpdated = statement.executeUpdate();

            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteProduct(int id) {

        String sql = "DELETE FROM products WHERE id = ?";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            int rowsDeleted = statement.executeUpdate();

            return rowsDeleted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}