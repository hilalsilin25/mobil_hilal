import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kütüphane',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // Başlangıçta giriş sayfası açılacak
    );
  }
}

// Giriş Sayfası
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kullanıcı adı girişi
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Şifre girişi
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Giriş butonu
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Basit bir kontrol ile giriş doğrulama
                if (username == 'admin' && password == '1234') {
                  // Başarılı giriş
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AnaSayfa()),
                  );
                } else {
                  // Hatalı giriş
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kullanıcı adı veya şifre yanlış!')),
                  );
                }
              },
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kütüphane',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    
    );
    
  }


// Kitaplar verisi
final List<Map<String, String>> kitaplar = [
  {
    'isim': 'Simyacı',
    'yazar': 'Paulo Coelho',
    'ozet': '''
Romanın ana karakteri Santiago, babasının zoruyla papaz okuluna gider. Ancak burada mutlu olamaz ve babasına dünyayı gezmek istediğini belirtir. Bunun üzerine de babası bir miktar altın vererek oğluna bir sürü almasını ve dünyayı dolaşmasını söyler.
Santiago, babasının verdiği parayla bir sürü alır ve dünyayı gezmeye başlar.
Santiago bir gece rüyasında birisinin gelip ona Mısır piramitlerinde gitmesini ve orada hazine bulacağını söyler. Rüyasını falcı bir kadına anlatan Santiago, Salem kralı ile tanışır. 
Kral, Santiago'ya sürüsünün onda birinin karşılığında, yaşamın gizemlerini anlatır.  Ayrıca siyah ve beyaz olan iki taşı da Santiago'ya yolculuğunda yardımcı olması için ona verir.
Mısır'a gitmek için tüm sürüsünü satan Santiago, yolda Arap bir çocukla tanışır. Arap, Santiago'nun tüm parasını alarak onu tek başına bırakır.
Para kazanmak için billuriciye dükkanında işe başlar, 6 ay sonra ise tekrardan yola çıkar. Yol boyunca pek çok güçlükle karşılaşan Santiago, hep kendi kalbini dinler. En son piramitlere ulaşır ve hazineye kavuşur.
''',

  },
  {
    'isim': '1984',
    'yazar': 'George Orwell',
    'ozet': '''
Winston Smith, Parti'nin dayattığı totaliter düzenin bir parçası olarak, günlük yaşamında ikiyüzlü bir şekilde yaşamak zorundadır. 
Ancak, Winston'un içsel dünyasında bu düzeni sorgulayan ve özgürlüğü arzulayan bir tutku vardır. Bu nedenle, gizlice Parti'nin düşünce polisinden saklanarak, toplumun dışına çıkmayı ve yasaklı kitapları okumayı denemektedir.
Winston'un hayatında önemli bir değişim, Julia adında bir kadını tanımasıyla başlar. Julia, Winston'un Parti'ye karşı olan isyanını paylaşan ve ona destek olan biridir.
İkisi, birlikte bir isyan planı yaparlar ve eski bir Parti üyesi olan O'Brien ile ilişkiye geçerler. O'Brien, Winston ve Julia'ya Parti'nin karşıtı bir hareketin parçası olduklarını söyleyerek onları kandırır ve birlikte yasaklı faaliyetlerde bulunmalarına izin verir.
Ancak, O'Brien'ın aslında bir Parti ajanı olduğu ortaya çıkar. Winston ve Julia, O'Brien tarafından tutuklanır ve işkenceye tabi tutulur. Bu süreçte, Winston'un fiziksel ve psikolojik olarak büyük bir baskı altında kalması, onun içsel direncini kırar. 
Parti, Winston'un bağımsız düşünce ve duygularını yok eder ve onu tamamen itaate zorlar.
Romanın sonunda, Winston'un Julia'ya olan duyguları ve isyanı tamamen ortadan kalkar. O, Parti'nin gücünü kabul eder ve Büyük Birader'e olan bağlılığını içtenlikle ifade eder. 
Roman, totaliter bir rejimin bireylerin özgürlüklerini nasıl sistematik bir şekilde yok ettiğini ve insan ruhunun bu baskılara karşı nasıl kırıldığını çarpıcı bir şekilde gözler önüne serer.

''',

  },
  {
    'isim': 'Sefiller',
    'yazar': 'Victor Hugo',
    'ozet': '''
Jan Valjean, sadece bir somun ekmek çaldığı için kürek cezasına çarptırılır. Ancak birkaç kez kaçmaya çalıştığı için cezası on dokuz yıla çıkarılmıştır. 1815'te serbest bırakılır fakat hapisten çıktıktan sonra inancını kaybeden, topluma öfke ve kin besleyen biri haline gelmiştir. Sefil bir şekilde "D" kasabasına gider. Kasabanın piskoposu ona iyilik gösterir ve böylece Jan Valjean’ın ruhu aydınlanır.   
Jan Valjean yıllar sonra kendine böylesine güzel davranıldığı için çok mutlu olur. Fakat Jan Valjean, bu güzel davranışa rağmen kendine engel olamayıp piskoposun gümüş yemek takımlarını çalar. Polis Jan Valjean’ı yakalar ve onu piskoposun karşısına çıkarır. Ancak Piskopos güzel davranışından ödün vermeyerek yemek takımlarını kendisinin hediye ettiğini söyler.
Hatta polisin yanında "Şamdanları unutmuşsun" diyerek Jan Valjean’ı kurtarır.
Jan Valjean, piskopostan özür diler ve hayatına dürüst ve erdemli bir insan olarak devam etmeye karar verir. Geçimini sağlamak için Fransa'nın kuzeyinde ucuz mücevher üretimi yapmaya başlar. Burada geçmişini gizler, kısa sürede zengin olmayı başarır ve hatta kasabada herkesin sevgisini kazandığı için belediye başkanı seçilir.
Ancak Jan Valjean'ın geçmişi hakkında şüpheler ortaya çıkar. Polis Javert, bir hırsızlık olayından hareketle araştırma yapar. Polisin araştırdığı konu, "D" kasabasındaki hırsızlık olayına kadar gelir. Jan Valjean yerine aynı isimde olan başka biri tutuklanır.
Bunun üzerine polis Javert, hata yaptığından dolayı Jan Valjean'dan özür dileyip istifa etmek ister. Polisin istifası kabul edilmez ve konu kapanır. Ancak Valjean, kendisi yerine bir başka kişinin hapse atılmasını kendi ahlakına uygun bulmaz. Bu yüzden hapishaneye girer ve yalnızca bir gece kaldıktan sonra hapishaneden kaçar.
Jan Valjean özverili bir şekilde çalışarak kazandığı parayı biriktirir ve teslim olmadan önce yanında götürür. Eski bir fahişe olan Fantina'nın ölümünden sonra kötü koşullarda yetişen Fantina'nın kızı Cosette'i bulur. Valjean, Cosette’i de yanına alır ve bir manastıra sığınırlar. Jan Valjean, manastırda bahçıvanlık yaparken evlat edindiği Cosette rahibe okuluna başlar.
Polis müfettişi Javert'ten kaçmayı başaran Jan Valjean, güvenli bir şekilde hayatını sürdürmektedir.
Seneler sessiz sedasız geçerken Cosette genç bir kadın haline gelir ve öğrenci Marius'a aşık olur. Marius, babası Napolyon ordusunda subaylık yapmış birinin oğludur ve zengin dedesi tarafından yetiştirilmiştir. O da Jan Valjean gibi haklıdan yana olan sosyalistlerin tarafını tutar ve 1832'deki başarısız Paris ayaklanmasına katılır.
Cosette ve Marius, Paris'te bulunan Luxemburg Gardens adlı bir parkta tanışır ve Jan Valjean kendini gizli tutmasına karşın gizlice mektuplaşırlar. Paris ayaklanırken sosyalistler isyan ederler. Marius ve arkadaşları da isyana katılırlar. Jan Valjean da aralarındadır. Paris kanlı bir şekilde yıkılırken Javert ile Jan Valjean yine karşı karşıya gelirler. Jan Valjean, Javert'i ve Marius'u ölümden kurtarır. Javert, Valjean'ı tutuklamaz ve Jan Valjean, Javert'i öldürmeye kalkmaz. 
Ancak bu asil davranış karşısında inandığı tüm değerlerin sarsıldığını gören Javert, ilk kez bir hükümlünün kanuna saygıda kusur etmeyen bir vatandaştan daha iyi bir insan olabileceğini düşünmeye başlar. Polis memuru olarak sahte ihtimallere göre iş yaptığına karar verir. Valjean'ı tutuklamak yerine kendini öldürür.
Başkaldıranların durumu parlak değildir. Yaralanan Marius’un durumu ağırdır ve Valjean onu yer altı kanalizasyonları vasıtasıyla kurtarır. Marius’u büyükbabasının evine götürür fakat kendisini kurtaran kişiyi tanımaz.
Valjean, Cosette'in Marius'u sevdiğini ve onunla evlenmek istediğini anlayarak aralarına girmemeye karar verir. Cosette'in eski bir mahkumun kızı olarak tanınmaması için ona büyük bir miktar para verir ve bir barones olarak yalnız yaşamasına izin verir.
Ancak Marius, hayatını Valjean’a borçlu olduğunu öğrenir. Bu yüzden Valjean'ın ölüm yatağında son anlarını yaşadığı zaman Cosette ile onu ziyaret ederler. Bu karşılaşmada, herkes duygusal anlar yaşar. Valjean, ölüm yatağında bile Cosette ve Marius'un mutlu olması için dua eder ve yıllar önce piskoposun kendisine hediye ettiği gümüş şamdanları Cosette'e verir.
Sonunda Cosette ve Marius evlenir. Valjean ise zamanla yaşlanıp yatağa düşer, bir süre sonra hayatını kaybeder.
''',
  },
  {
    'isim': 'Hayvan Çiftliği',
    'yazar': 'George Orwell',
    'ozet': '''
Bay Jones, Beylik Çiftliği'nin sahibidir. Bir gece çok sarhoş olduğu için yattığı sırada, Koca Reis adı verilen bir domuz rüya gördüğünü söyler ve rüyasını anlatmak ister. Tüm hayvanları çağırır. Bunun üzerine Bluebell, Jessie, Pincher adlı köpekler, domuzlar, tavuklar, güvercinler, Benjamin adlı eşek, Boxer ve Clover adlı iki at, beyaz keçi Muriel ve diğer bütün hayvanlar bir araya gelir.
Koca Reis, konuşmasında hayatlarının yoksulluk, açlık ve sabahtan akşama dek koşturmaca içinde geçtiğini söyler. Sefillik ve kölelikten ibaret olan hayatlarına dikkat çeker. İngiltere'deki tüm hayvanların özgür olmadığını ve insanların üretmeden tüketen tek yaratıklar olduğunu anlatır.
Asıl meseleye gelerek "Neden bu sefilliğe boyun eğelim?" der ve tüm hayvanların tek gerçek düşmanlarının insan olduğuna karar vermesini sağlar.
Koca Reis sonunda gördüğü rüyayı açıklar. İnsanların ortadan kalkması durumunda yeryüzünün nasıl bir yer olacağını görmüştür. Ayrıca "İngiltere'nin Hayvanları" adlı bir şarkının ezgisini duymuştur. Bu şarkı, tüm hayvanların içinde müthiş bir coşku uyandırır ve birlikte söylerken tüm çiftlik inlemeye başlar. 
Ne yazık ki Bay Jones gürültüden uyanır, tüfeğini kaptığı gibi karanlığa saçmalar yağdırır ve kısa süre sonra tüm çiftlik uyumaya devam eder.
Birkaç gün sonra Koca Reis uykusunda ölür ve yaptığı konuşma, diğer hayvanlar için yeni bir çığır açar. En zeki hayvanlar olarak bilinen domuzlar, Snowball ve Napoleon'a eğitme ve örgütlenme işi verilir. Yoğun toplantılar sonucu ayaklanmaya karar verirler ve bir gün Bay Jones, tüm hayvanları aç bırakır ve birkaç işçi hayvanları kırbaçlar.
Buna karşılık, hayvanlar ayaklanır ve başarılı bir isyan gerçekleştirirler. Jones çiftlikten kovulur ve çiftliğin adı artık "Hayvan Çiftliği" olarak değişir.
Domuzlar, hayvancılık ilkelerini belirlemek için üç ay boyunca çalışarak yedi emir belirler. Tüm hayvanlar, bu kuralları kabul eder.
Bazı zamanlar, analarından emdikleri süt burunlarından gelir. Aletler, hayvanlara göre olmadığı için büyük zorluklarla karşılaşırlar. Sadece zeki domuzlar, her işin üstesinden gelebilmektedir. Diğerleri, işleri yönetmek ve denetlemekle meşgul oldukları için doğrudan çalışmazlar. Tüm hayvanlar, ekinleri biçip toplamak için çalışır.
Ancak kısrak Mollie sabahları erken kalkamaz, yaşlı eşek Benjamin uyuşuktur ve dik kafalılığa devam eder, kedi de işlerin yoğun olduğu zamanlarda genellikle ortadan kaybolur. Her pazar günü, Snowball tarafından yapılan resmi bayraklar göndere çekilir ve tüm hayvanlar toplantı denilen genel kurula katılır. 
Kararlar tartışılırken toplantının en ateşli konuşmacıları Snowball ve Napoleon'dur. Diğer hayvanlara gerekli açıklamaları yapmak için Squealer adlı bir domuz görevlendirilmiştir.
Sonbaharda olup bitenler bütün ülkeye duyurulur. Komşu çiftliklerin hayvanlarına ayaklanmanın öyküsü anlatılır ve "İngiltere'nin Hayvanları" şarkısı öğretilir. Diğer çiftçiler, Jones'un başına gelen talihsizlikten nasıl faydalanacaklarını düşünürken Foxwood Çiftliği'nin sahibi Bay Pilkington ile Pinchfield Çiftliği'nin sahibi Bay Frederick birbirleriyle geçinemez haldedir. Ancak Napoleon, ilerleyen zamanlarda her ikisinden de faydalanmayı başarır. 
Bir gün Jones, adamları ve bu çiftlik sahipleri, çiftliğini geri almak için baskın düzenler ve aralarında kanlı bir savaş çıkar. Sonuç olarak zafer, hayvanların olur.
Snowball ve Napoleon arasında zamanla anlaşmazlıklar ortaya çıksa da çiftliğin yönetimi her zaman zeki domuzların elindedir. Snowball'un önerisiyle, işleri kolaylaştıracak ve sadece üç gün çalışacakları bir rüzgar değirmeni yapma fikrine karar verilir. Ancak Napoleon buna karşı çıkarak köpeklerini saldırması için üzerine salar ve Snowball'un kaçmasına neden olur. Bu taktikle başa sadece Napoleon geçer ve rüzgar değirmenini çalıştırmaya başlar.

Bir yıl boyunca hayvanlar köle gibi çalışır ancak her şey gelecekteki hayatları için yapılmıştır. Napoleon zamanla çiftlikte kuralları değiştirir ve her konuşmasıyla hayvanları ikna ederek kendine bağlar ve hayran bırakır. Ancak domuzlar diğer hayvanlardan daha lüks bir yaşama geçerek Jones'un evine yerleşmeye başlarlar. Diğer hayvanlar aralarında itiraz etseler de domuzların mutlaka bir açıklaması vardır.
Artık diğer hayvanlar, Napoleon'un çiftlik evinin bahçesinde pipo içmesine, Bay ve Bayan Jones'un giydiği kıyafetleri giyerek şaşaalı ve eğlenceli bir yaşam sürmesine şaşırmamaktadır.
Bir akşam çiftliğe gelen çiftçiler her şeyden, özellikle yel değirmeninden çok etkilenirler. Akşamın ilerleyen saatlerinde, kahkahalar ve şarkılar yükselirken diğer hayvanlar evin bahçesinden gizlice olayları izlemeye başlar. İnsanlar ve hayvanlar ilk kez eşit koşullarda buluşmuştur. Bay Pilkington, masada bir esprisiyle ortamı neşelendirir: "Sizler aşağı kesimlerde hayvanlarınızla uğraşırken bizler de aşağı sınıflardan insanlarımızla uğraşıyoruz."
Masadakiler, bu espriye gülmekten bardakları kaldıramaz.
Napoleon'un onurla yönettiği çiftlik, bir kooperatif girişimiydi. Bugüne kadar hayvanlar arasında birbirlerine "yoldaş" demek aptalca bir alışkanlıktı ve bu alışkanlığa son verilmesine karar verilmişti. Bayrakların artık tek renk olması gerekiyordu ve çiftlik ise tekrardan "Beylik Çiftlik" ismini alacaktı. Gecenin ilerleyen saatlerinde evde büyük bir gürültü kopar. Oynadıkları kağıt oyununda Napoleon ve Bay Pilkington'ın aynı elinde maça ası çıkar.
Diğer hayvanlar artık sadece şunu düşünüyordu: Domuzlar ve insanlar arasında bir fark yoktu, artık ikisi de birbirinden ayırt edilemiyordu.
''',

  },
  {
    'isim': 'Kürk Mantolu Madonna',
    'yazar': 'Sabahattin Ali',
    'ozet': '''
Roman, anlatıcının işsiz kaldıktan sonra bir arkadaşı aracılığıyla bir şirkette iş bulması ve burada Raif Efendi ile tanışmasıyla başlar. Raif Efendi, sessiz, içine kapanık ve sıradan bir adam olarak tanınmaktadır.
Ancak, Raif Efendi'nin yazdığı bir günlük, anlatıcının eline geçer ve onun gerçek kimliğini ve geçmişini ortaya çıkarır.
Raif Efendi'nin günlüğü, onun gençlik yıllarına ve Berlin'de geçirdiği günlere ışık tutar. Berlin'de sanatla ilgilenen Raif, bir gün bir sanat galerisine gider ve orada, "Kürk Mantolu Madonna" adlı bir portreye rastlar.
Portredeki kadın, Maria Puder, Raif'i derinden etkiler ve onunla tanışmak için büyük bir arzu duyar. Bir süre sonra, Raif tesadüfen Maria Puder ile tanışır ve aralarında tutkulu bir aşk başlar.
Maria, bağımsız ve güçlü bir karakterdir; Raif ise naif ve içe dönük biridir. Bu zıtlıklarına rağmen, birbirlerine derin bir sevgiyle bağlanırlar. Ancak, aşkları çeşitli engeller ve zorluklarla sınanır.
Maria ve Raif'in ilişkisi, duygusal yoğunluk ve derin bir bağ içerir. Maria'nın ani ve beklenmedik ölümü, Raif'i derinden sarsar ve hayatını altüst eder.
Raif Efendi, Maria'nın ölümünden sonra Türkiye'ye döner ve içine kapanır. İstanbul'daki monoton ve sıradan yaşamına geri döner, ancak içindeki büyük aşkı ve acıyı hep saklı tutar.
Günlük, Raif'in yaşadığı derin aşkı ve kaybı ortaya çıkararak, onun gerçek kimliğini ve duygusal dünyasını gözler önüne serer.
''',
  },
];

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitaplığım'),
        backgroundColor: Colors.deepPurple,
      ), 
      
      body:
       ListView.builder(
        itemCount: kitaplar.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final kitap = kitaplar[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.book,
                  color: Colors.white,
                  
              ),
              ),
             
 title: Text(
                kitap['isim']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                kitap['yazar']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.deepPurple,
              ),
              onTap: () {
                // Kitap detay sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KitapDetayPage(kitap: kitap),
                  ),
                  
                );
         
              },
            ),
          );
        },
      ),
    );
  }
}
class KitapDetayPage extends StatelessWidget {
  final Map<String, String> kitap;

  KitapDetayPage({required this.kitap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kitap['isim']!),
        backgroundColor: Colors.deepPurple,
     
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kitap Yazarını Göster
            Text(
              'Yazar: ${kitap['yazar']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              
            ),
            SizedBox(height: 20),
          
            // Kitap Özeti Başlığı
            Text(
              'Kitap Özeti:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              
            ),
            SizedBox(height: 10),

            // Kitap Özetini Göster
            Text(
              kitap['ozet']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}




 
      
      
       
  

    
