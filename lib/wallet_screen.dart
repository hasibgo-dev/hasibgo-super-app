import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final double walletBalance = 1500.50;

    final List> transactions = [

    {"title": "টাকা ডিপোজিট (বিকাশ)", "amount": "+৫০০ টাকা", "date": "গতকাল, ৩:১৫ PM", "type": "credit"},
    {"title": "পেমেন্ট পাঠিয়েছি (রিচার্জ)", "amount": "-১,০০০ টাকা", "date": "আজ, ১১:১০ AM", "type": "debit"},
    {"title": "বুক অর্ডার ক্যাশব্যাক", "amount": "+৫০ টাকা", "date": "৩ দিন আগে", "type": "credit"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HasibGo - ওয়ালেট ও পেমেন্ট'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.green.shade700,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'বর্তমান ওয়ালেট ব্যালেন্স',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '৳ $walletBalance',
                      style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green.shade800,
                          ),
                          icon: const Icon(Icons.add),
                          label: const Text('টাকা অ্যাড করুন'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ডিপোজিট পেজে যাওয়া হচ্ছে...')),
                            );
                          },
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.send),
                          label: const Text('সেন্ড মানি'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'সাম্প্রতিক লেনদেনসমূহ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  bool isCredit = tx['type'] == 'credit';
                  return Card(
                    elevation: 1,
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isCredit ? Colors.green.shade50 : Colors.red.shade50,
                        child: Icon(
                          isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                          color: isCredit ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(tx['title'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(tx['date'].toString(), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      trailing: Text(
                        tx['amount'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCredit ? Colors.green : Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
