import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // ব্যবহারকারীর তথ্য লেখার জন্য টেক্সট কন্ট্রোলারগুলো
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - নতুন অ্যাকাউন্ট"),
        backgroundColor: Colors.green, // সবুজ বা ডার্ক গ্রীন থিম
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "একাউন্ট তৈরি করুন",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "HasibGo সুপার অ্যাপে স্বাগতম। আপনার সঠিক তথ্য দিয়ে রেজিস্ট্রেশন করুন।",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // নাম লেখার ঘর
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "আপনার নাম",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              // মোবাইল নম্বর লেখার ঘর
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "মোবাইল নম্বর",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 15),

              // পাসওয়ার্ড লেখার ঘর
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "পাসওয়ার্ড দিন",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              // সাইন-আপ বাটন
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // এখানে রেজিস্ট্রেশনের কাজ হবে
                    String name = nameController.text;
                    String phone = phoneController.text;
                    print("Name: $name, Phone: $phone");
                  },
                  child: const Text(
                    "রেজিস্ট्रার করুন",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
