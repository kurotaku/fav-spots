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


# カテゴリ登録
Category.create(name: '西国三十三所観音霊場', slug: 'route-1', category_type: 'route')
Category.create(name: '坂東三十三観音', slug: 'route-2', category_type: 'route')

Category.create(name: '学業', slug: 'gakugyo', category_type: 'luck')
Category.create(name: '縁結び', slug: 'enmusubi', category_type: 'luck')
Category.create(name: '厄除け', slug: 'yakuyoke', category_type: 'luck')
Category.create(name: '合格祈願', slug: 'gokaku', category_type: 'luck')
Category.create(name: '安産', slug: 'anzan', category_type: 'luck')
Category.create(name: '病気平癒', slug: 'byokiheiyu', category_type: 'luck')
Category.create(name: '八方除', slug: 'happo', category_type: 'luck')
Category.create(name: '方位除', slug: 'houi', category_type: 'luck')
Category.create(name: '開運', slug: 'kaiun', category_type: 'luck')
Category.create(name: '商売繁盛', slug: 'hanjyo', category_type: 'luck')
Category.create(name: '眼病平癒', slug: 'ganbyoheiyu', category_type: 'luck')
Category.create(name: '長寿', slug: 'chojyu', category_type: 'luck')
Category.create(name: '芸能', slug: 'geino', category_type: 'luck')
Category.create(name: '縁切り', slug: 'enkiri', category_type: 'luck')
Category.create(name: '子授け', slug: 'kosazuke', category_type: 'luck')

Category.create(name: '国宝', slug: 'kokuho', category_type: 'feature')
Category.create(name: '世界遺産', slug: 'sekaiisan', category_type: 'feature')
Category.create(name: '御朱印', slug: 'gosyuin', category_type: 'feature')
Category.create(name: '一宮', slug: 'ichinomiya', category_type: 'feature')
Category.create(name: '国重要文化財', slug: 'kuni-jyuyo', category_type: 'feature')
Category.create(name: '道重要文化財', slug: 'do-jyuyo', category_type: 'feature')
Category.create(name: '県重要文化財', slug: 'ken-jyuyo', category_type: 'feature')
Category.create(name: '府重要文化財', slug: 'fu-jyuyo', category_type: 'feature')
Category.create(name: '国重要無形民俗文化財', slug: 'kuji-jyuyo-mukei', category_type: 'feature')
Category.create(name: '国史跡', slug: 'kunisiseki', category_type: 'feature')


admin_user.spots.create(name: '久伊豆神社', kana: 'ひさいずじんじゃ', address: '埼玉県越谷市越ヶ谷１７００', pref: 'Saitama')
admin_user.spots.create(name: '越谷 香取神社', kana: 'かとりじんじゃ', address: '埼玉県越谷市大沢３丁目１３−３８', pref: 'Saitama')
admin_user.spots.create(name: '草加神社', kana: 'そうかじんしゃ', address: '埼玉県草加市氷川町２１１８−２', pref: 'Saitama')
admin_user.spots.create(name: '鶴岡八幡宮', kana: 'つるおかはちまんぐう', category_ids: [7, 18, 22, 24, 27], address: '神奈川県鎌倉市雪ノ下２丁目１−３１', pref: 'Kanagawa', phone: '0467-22-0315', access: 'JR横須賀線ほか鎌倉駅より徒歩10分', since: '1063', deity: '応神天皇、比売神、神功皇后', sect: '')
admin_user.spots.create(name: '武蔵一宮氷川神社', kana: 'ひかわじんじゃ', address: '埼玉県さいたま市大宮区高鼻町１−４０７', pref: 'Saitama')
admin_user.spots.create(name: '清水寺', kana: 'きよみずでら', address: '京都府京都市東山区清水１丁目２９４', pref: 'Kyoto')
admin_user.spots.create(name: '出雲大社', kana: 'いずもたいしゃ', category_ids: [18, 22, 24], address: '島根県出雲市大社町杵築東１９５', pref: 'Shimane')
admin_user.spots.create(name: '寒川神社', kana: 'さむかわじんじゃ', address: '神奈川県高座郡寒川町宮山３９１６', pref: 'Kanagawa')
admin_user.spots.create(name: '榛名神社', kana: 'はるなじんじゃ', address: '群馬県高崎市榛名山町８４９', pref: 'Gunma')
admin_user.spots.create(name: '前橋東照宮', kana: 'まえばしとうしょうぐう', address: '群馬県前橋市大手町３丁目１３−１９', pref: 'Gunma')
admin_user.spots.create(name: '総社神社', kana: 'そうじゃじんじゃ', address: '群馬県前橋市元総社町１丁目３１−４５', pref: 'Gunma')
admin_user.spots.create(name: '前橋八幡宮', kana: 'まえばしはちまんぐう', address: '群馬県前橋市本町２丁目７−７', pref: 'Gunma')
admin_user.spots.create(name: '産泰神社', kana: 'さんたいじんじゃ', address: '群馬県前橋市下大屋町５６９', pref: 'Gunma')
admin_user.spots.create(name: '赤城神社', kana: 'あかぎじんじゃ', address: '群馬県前橋市三夜沢町１１４', pref: 'Gunma')
admin_user.spots.create(name: '駒形神社', kana: 'こまがたじんじゃ', address: '群馬県前橋市駒形町710', pref: 'Gunma')
admin_user.spots.create(name: '代々木八幡宮', kana: 'よよぎはちまんぐう', address: '東京都渋谷区代々木５丁目１−１', pref: 'Tokyo')
admin_user.spots.create(name: '明治神宮', kana: 'めいじじんぐう', category_ids: [4, 22], address: '東京都渋谷区代々木神園町１−１', pref: 'Tokyo')
admin_user.spots.create(name: '東郷神社', kana: 'とうごうじんじゃ', address: '東京都渋谷区神宮前１丁目５−３', pref: 'Tokyo')

admin_user.spots.create(name: '三光院', kana: 'さんこういん', category_ids: [24], address: '群馬県沼田市柳町３９２', phone: '0278-24-4465', access: 'JR上越線・沼田駅よりバスで三光院前下車すぐ', since: '1324', deity: '十一面観世音菩薩', sect: '天台宗', pref: 'Gunma')
admin_user.spots.create(name: '長谷寺', kana: 'ちょうこくじ', category_ids: [2, 24], address: '群馬県高崎市白岩町４４８', phone: '027-343-0349', access: 'JR上越新幹線ほか高崎駅よりバスでトドメキ下車、徒歩30分', since: '686', sect: '金峯山修験本宗', deity: '十一面観世音菩薩', pref: 'Gunma')
admin_user.spots.create(name: '世良田東照宮', kana: 'せらだとうしょうぐう', category_ids: [22, 24, 27], address: '群馬県太田市世良田町３１１９−１', phone: '0276-52-2045', access: 'JR東武伊勢崎線・世良田駅より徒歩20分', since: '1639または1644', sect: '', deity: '徳川家康公', pref: 'Gunma')
admin_user.spots.create(name: '水澤寺', kana: 'みずさわでら', category_ids: [2, 24], address: '群馬県渋川市伊香保町水沢２１４', phone: '', access: 'JR上越新幹線ほか高崎駅よりバスで水澤観音前下車すぐ', since: '593～628', sect: '天台宗', deity: '十一面千手観世音菩薩', pref: 'Gunma')
admin_user.spots.create(name: '雷電神社', kana: 'らいでんじんじゃ', category_ids: [22, 24], address: '群馬県邑楽郡板倉町２３３４', phone: '0276-82-0007', access: '東武日光線・板倉東洋大前駅よりバスで役場入口下車、徒歩10分', since: '推古天皇の御代', sect: '', deity: '火雷大神、大雷大神、別雷大神、菅原道真公', pref: 'Gunma')
admin_user.spots.create(name: '大光院', kana: 'だいこういん', address: '群馬県太田市金山町３７−８', phone: '276-22-2007', access: '東武伊勢崎線ほか太田駅より徒歩20分', since: '1611', sect: '浄土宗', deity: '阿弥陀如来', pref: 'Gunma')
admin_user.spots.create(name: '達磨寺', kana: 'だるまじ', address: '群馬県高崎市鼻高町２９６', phone: '27-322-8800', access: 'JR上越新幹線ほか高崎駅よりバスで少林山入口下車すぐ', since: '1697', sect: '黄檗宗', deity: '北辰鎮宅霊符尊、達磨大師、観音菩薩', pref: 'Gunma')
admin_user.spots.create(name: '日向見薬師堂', kana: 'ひなたみやくしどう', category_ids: [22], address: '群馬県吾妻郡中之条町四万４３７１', phone: '0279-75-8814', access: 'JR吾妻線・中之条駅よりバスで四万温泉下車、徒歩30分', since: '989', sect: '', deity: '薬師如来', pref: 'Gunma')






