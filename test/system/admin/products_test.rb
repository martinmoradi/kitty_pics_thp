require "application_system_test_case"

class Admin::ProductsTest < ApplicationSystemTestCase
  setup do
    @admin_product = admin_products(:one)
  end

  test "visiting the index" do
    visit admin_products_url
    assert_selector "h1", text: "Admin/Products"
  end

  test "creating a Product" do
    visit admin_products_url
    click_on "New Admin/Product"

    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit admin_products_url
    click_on "Edit", match: :first

    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit admin_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
