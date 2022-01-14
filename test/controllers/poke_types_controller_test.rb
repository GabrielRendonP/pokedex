require 'test_helper'

class PokeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poke_type = poke_types(:one)
  end

  test 'should get index' do
    get poke_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_poke_type_url
    assert_response :success
  end

  test 'should create poke_type' do
    assert_difference('PokeType.count') do
      post poke_types_url, params: { poke_type: { name: @poke_type.name } }
    end

    assert_redirected_to poke_type_url(PokeType.last)
  end

  test 'should show poke_type' do
    get poke_type_url(@poke_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_poke_type_url(@poke_type)
    assert_response :success
  end

  test 'should update poke_type' do
    patch poke_type_url(@poke_type), params: { poke_type: { name: @poke_type.name } }
    assert_redirected_to poke_type_url(@poke_type)
  end

  test 'should destroy poke_type' do
    assert_difference('PokeType.count', -1) do
      delete poke_type_url(@poke_type)
    end

    assert_redirected_to poke_types_url
  end
end
