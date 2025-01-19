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
Simyacı, bir çobanın kendi yolculuğunu ve hayallerini takip etme sürecini anlatan bir kitaptır.
Santiago adlı genç bir çoban, bir hazineyi bulma arayışında, yolculukları sırasında karşılaştığı çeşitli karakterlerden hayat dersleri alır.
Kitap, kişisel gelişim ve ruhsal arayışla ilgili derin mesajlar içerir.
''',

  },
  {
    'isim': '1984',
    'yazar': 'George Orwell',
    'ozet': '''
1984, totaliter bir rejim altında yaşayan bir adamın hikayesidir. Winston Smith, Partiye karşı duyduğu hoşnutsuzluğu gizli bir şekilde dışa vurur.
Kitap, bireysel özgürlüğün ve düşünce özgürlüğünün baskı altında olduğu bir distopyayı anlatır.
Orwell, bireysel özgürlüğün yok edilmesi ve toplumun kontrol altına alınması konusunu işler.
''',

  },
  {
    'isim': 'Sefiller',
    'yazar': 'Victor Hugo',
    'ozet': '''
Sefiller, Fransız Devrimi’nin sonrasındaki dönemde, düşük sınıfın hayatını anlatan bir eserdir.
Jean Valjean, haksız yere hapse düşmüş bir adamdır ve hayatı boyunca adaletin peşinden gitmeye çalışır.
Kitap, adalet, sevgi, fedakarlık ve insanlık üzerine derin bir inceleme sunar.
''',
  },
  {
    'isim': 'Hayvan Çiftliği',
    'yazar': 'George Orwell',
    'ozet': '''
Hayvan Çiftliği, bir grup çiftlik hayvanının, zalim çiftlik sahibinden kurtulup özgürlüklerini kazandıkları bir hikayedir.
Ancak hayvanlar özgürlüklerini kazandıktan sonra, kendi aralarındaki liderlik çatışmaları başlar.
Bu kitap, siyasi bir alegori olarak, totalitarizmi ve güç mücadelesini anlatır.
''',

  },
  {
    'isim': 'Kürk Mantolu Madonna',
    'yazar': 'Sabahattin Ali',
    'ozet': '''
Kürk Mantolu Madonna, psikolojik bir roman olup, bir adamın kaybolan bir kadına duyduğu aşkı konu alır.
Raif Efendi, İstanbul'da bir işadamıdır ve hayatı, bir ressam olan Maria Puder'e olan büyük aşkı ile değişir.
Kitap, yalnızlık, aşk ve içsel dünyaların keşfi üzerine derin bir bakış sunar.
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




 
      
      
       
  

    
