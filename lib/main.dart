import 'package:flutter/material.dart';

void main() {
  runApp(KamuIlanApp());
}

class KamuIlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamu İlan & GUY Takip',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IlanListeSayfasi(),
    );
  }
}

class IlanListeSayfasi extends StatelessWidget {
  final List<Map<String, dynamic>> ornekIlanlar = [
    {
      "sinav_adi": "Özelleştirme İdaresi Başkanlığı Uzman Yardımcılığı",
      "kpss": "KPSSP48 (Min 75)",
      "kontenjan": "15 Kişi",
      "sinava_girecek": "60 Kişi (4 Katı)",
      "dil": "VAR (YDS C Seviyesi)",
      "yer": "Ankara (Merkez)",
      "guy_notlari": [
        "✅ AVANTAJ: Merkez Teşkilatı kadrosu (GUY'a göre maaş ve ek gösterge daha yüksek).",
        "❌ DEZAVANTAJ: YDS / İngilizce şartı var (GUY'da dil aranmaz).",
        "⚖️ ÖZLÜK: Kariyer uzman yardımcılığı özlük hakları standart taşradan üstündür."
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamu İlan & GUY Kıyaslama'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.builder(
        itemCount: ornekIlanlar.length,
        itemBuilder: (context, index) {
          final ilan = ornekIlanlar[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ilan['sinav_adi']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900)),
                  Divider(),
                  Text("📋 KPSS Puanı: ${ilan['kpss']}"),
                  Text("👥 Kontenjan: ${ilan['kontenjan']} | Sınava Çağrı: ${ilan['sinava_girecek']}"),
                  Text("🌐 Dil Şartı: ${ilan['dil']}"),
                  Text("📍 Çalışma Yeri: ${ilan['yer']}"),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("⚖️ GELİR UZMANLIĞI (GUY) KIYASLAMASI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue.shade800)),
                        SizedBox(height: 4),
                        ...((ilan['guy_notlari'] as List<String>).map((not) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Text(not, style: TextStyle(fontSize: 13)),
                        )))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
