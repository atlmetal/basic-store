store = Store.create!(name: "Mi Tienda de Comercio", total_sales: 0.0)

products = [
  {
    sku: 'EA001',
    name: 'Camiseta Básica',
    description: 'Camiseta de algodón 100%',
    available_units: 50,
    unit_price: 25_000
  },
  {
    sku: 'WE002',
    name: 'Café Premium',
    description: 'Café colombiano de alta calidad',
    available_units: 10_000,
    unit_price: 15
  },
  {
    sku: 'SP003',
    name: 'Pack de Notebooks',
    description: 'Cuadernos universitarios con descuento especial',
    available_units: 100,
    unit_price: 5000
  }
]

products.each do |data|
  store.products.create!(data)
end

user = store.users.create!(
  name: 'Usuario Demo',
  email: 'demo@tienda.com'
)

puts 'Datos de ejemplo creados exitosamente!'
puts "- Tienda: #{store.name}"
puts "- Productos: #{store.products.count}"
puts "- Usuario: #{user.name}"
