package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import util.DBconnect;

public class CategoryDAO {

    public List<Category> getAllCategories() {

        List<Category> categories = new ArrayList<>();

        String sql = "SELECT * FROM categories";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Category category = new Category();

                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));

                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ERROR: Cannot load categories.");
        }

        return categories;
    }

    public boolean insertCategory(Category category) {

        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, category.getName());
            statement.setString(2, category.getDescription());

            int rowsInserted = statement.executeUpdate();

            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Category getCategoryById(int id) {

        Category category = null;

        String sql = "SELECT * FROM categories WHERE id = ?";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    category = new Category();

                    category.setId(resultSet.getInt("id"));
                    category.setName(resultSet.getString("name"));
                    category.setDescription(resultSet.getString("description"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return category;
    }

    public boolean updateCategory(Category category) {

        String sql = "UPDATE categories SET name = ?, description = ? WHERE id = ?";

        try (
            Connection connection = DBconnect.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, category.getName());
            statement.setString(2, category.getDescription());
            statement.setInt(3, category.getId());

            int rowsUpdated = statement.executeUpdate();

            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCategory(int id) {

        String sql = "DELETE FROM categories WHERE id = ?";

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