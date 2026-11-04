import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // ইউজারের ওয়ালেট ব্যালেন্স
  final double walletBalance = ১,২৫০০.৫০;

  // ট্রানজেকশন হিস্ট্রি বা লেনদেনের তালিকা
  final List> transactions = [
    {"title": "রাইড শেয়ারিং পেমেন্ট", "amount": "-৩৫০ টাকা", "date": "আজ, ০২:৩০ PM", "type": "debit"},
    {"title": "ওয়ালেট রিচার্জ (বিকাশ)", "amount": "+১,০০০ টাকা", "date": "গতকাল, ১১:১৫ AM", "type": "credit"},
    {"title": "ফুড অর্ডার ক্যাশব্যাক", "amount": "+৫০ টাকা", "date": "৩ দিন আগে", "type": "credit"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - ওয়ালেট ও পেমেন্ট"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ওয়ালেট ব্যালেন্স কার্ড
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
                      "বর্তমান ওয়ালেট ব্যালেন্স",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "৳ $walletBalance",
                      style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
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
                          label: const Text("টাকা অ্যাড করুন"),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("রিচার্জ গেটওয়ে ওপেন হচ্ছে...")),
                            );
                          },
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.send),
                          label: const Text("সেন্ড মানি"),
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
              "সাম্প্রতিক লেনদেনসমূহ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),

            // ট্রানজেকশন লিস্ট
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
                      title: Text(tx['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(tx['date']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      trailing: Text(
                        tx['amount']!,
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
