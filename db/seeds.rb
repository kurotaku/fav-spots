# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー登録
root_user = User.new(name: 'root user', email: 'root@root.com', root: true, admin: true)
root_user.password = 'root'
root_user.password_confirmation = 'root'
root_user.save!

admin_user = User.new(name: '管理者', email: 'admin@admin.com', root: false, admin: true)
admin_user.password = 'admin'
admin_user.password_confirmation = 'admin'
admin_user.save!

test_user = User.new(name: 'テストユーザー', email: 'test@test.com', root: false, admin: false)
test_user.password = 'test'
test_user.password_confirmation = 'test'
test_user.save!

admin_user.spots.create(name: '久伊豆神社', address: '埼玉県越谷市越ヶ谷１７００', pref: 'Saitama', latitude: '35.9018', longitude: '139.791')
admin_user.spots.create(name: '越谷 香取神社', address: '埼玉県越谷市大沢３丁目１３−３８', pref: 'Saitama', latitude: '35.9017', longitude: '139.782')
admin_user.spots.create(name: '草加神社', address: '埼玉県草加市氷川町２１１８−２', pref: 'Saitama', latitude: '35.8274', longitude: '139.801')
admin_user.spots.create(name: '鶴岡八幡宮', address: '神奈川県鎌倉市雪ノ下２丁目１−３１', pref: 'Kanagawa', latitude: '35.3249', longitude: '139.556')
admin_user.spots.create(name: '武蔵一宮氷川神社', address: '埼玉県さいたま市大宮区高鼻町１−４０７', pref: 'Saitama', latitude: '35.9148', longitude: '139.63')
admin_user.spots.create(name: '清水寺', address: '京都府京都市東山区清水１丁目２９４', pref: 'Kyoto', latitude: '34.9945', longitude: '135.784')
admin_user.spots.create(name: '出雲大社 ', address: '島根県出雲市大社町杵築東１９５', pref: 'Shimane', latitude: '35.4011', longitude: '132.685')
admin_user.spots.create(name: '寒川神社 ', address: '神奈川県高座郡寒川町宮山３９１６', pref: 'Kanagawa', latitude: '35.3788943', longitude: '139.3832276')
admin_user.spots.create(name: '榛名神社 ', address: '群馬県高崎市榛名山町８４９', pref: 'Gunma', latitude: '36.4563', longitude: '138.852')
