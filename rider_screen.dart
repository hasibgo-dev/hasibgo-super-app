import 'package:flutter/material.dart';

class RiderScreen extends StatefulWidget {
  const RiderScreen({super.key});

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  // রাইডার অনলাইন বা অফলাইন স্ট্যাটাস
  bool isOnline = true;

  // রাইডারের কাছে আসা নতুন ট্রিপ রিকোয়েস্টের তালিকা
  List> tripRequests = [
    {"tripId": "ট্রিপ #৩০১", "pickup": "ধানমন্ডি ২৭", "destination": "گلshan ২", "fare": "৩৫০ টাকা"},
    {"tripId": "ট্রিপ #৩০২", "pickup": "বনানী ১১", "destination": "উত্তরা সেক্টর ৭", "fare": "৪৫০ টাকা"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - রাইডার প্যানেল"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // রাইডার স্ট্যাটাস কার্ড
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "রাইডার স্ট্যাটাস",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isOnline ? "আপনি বর্তমানে অনলাইনে আছেন (ট্রিপ গ্রহণ করতে পারবেন)" : "আপনি বর্তমানে অফলাইনে আছেন",
                          style: TextStyle(
                            fontSize: 12,
                            color: isOnline ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: isOnline,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          isOnline = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "নতুন ট্রিপ রিকোয়েস্ট (লাইভ)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),

            // ট্রিপ রিকোয়েস্ট লিস্ট
            Expanded(
              child: isOnline
                  ? tripRequests.isEmpty
                      ? const Center(child: Text("বর্তমানে কোনো নতুন ট্রিপ রিকোয়েস্ট নেই"))
                      : ListView.builder(
                          itemCount: tripRequests.length,
                          itemBuilder: (context, index) {
                            final trip = tripRequests[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${trip['tripId']}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        Text(
                                          "${trip['fare']}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Text("পিকআপ: ${trip['pickup']}"),
                                    Text("গন্তব্য: ${trip['destination']}"),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            // ট্রিপ বাতিল বা ইগনোর করার লজিক
                                            setState(() {
                                              tripRequests.removeAt(index);
                                            });
                                          },
                                          child: const Text("বাতিল", style: TextStyle(color: Colors.red)),
                                        ),
                                        const SizedBox(width: 10),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                          onPressed: () {
                                            // ট্রিপ গ্রহণ করার লজিক
                                            setState(() {
                                              tripRequests.removeAt(index);
                                            });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text("ট্রিপটি সফলভাবে গ্রহণ করা হয়েছে!")),
                                            );
                                          },
                                          child: const Text("গ্রহণ করুন", style: TextStyle(color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                  : const Center(
                      child: Text(
                        "আপনি অফলাইন মোডে থাকায় কোনো ট্রিপ দেখা যাচ্ছে না।",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
