require 'test_helper'

class CertificadosControllerTest < ActionController::TestCase
  setup do
    @certificado = certificados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certificados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certificado" do
    assert_difference('Certificado.count') do
      post :create, certificado: { numero_certificado: @certificado.numero_certificado, numero_codigo_producto: @certificado.numero_codigo_producto, numero_colada: @certificado.numero_colada, numero_guia_proveedor: @certificado.numero_guia_proveedor, numero_orden_compra: @certificado.numero_orden_compra }
    end

    assert_redirected_to certificado_path(assigns(:certificado))
  end

  test "should show certificado" do
    get :show, id: @certificado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certificado
    assert_response :success
  end

  test "should update certificado" do
    patch :update, id: @certificado, certificado: { numero_certificado: @certificado.numero_certificado, numero_codigo_producto: @certificado.numero_codigo_producto, numero_colada: @certificado.numero_colada, numero_guia_proveedor: @certificado.numero_guia_proveedor, numero_orden_compra: @certificado.numero_orden_compra }
    assert_redirected_to certificado_path(assigns(:certificado))
  end

  test "should destroy certificado" do
    assert_difference('Certificado.count', -1) do
      delete :destroy, id: @certificado
    end

    assert_redirected_to certificados_path
  end
end
