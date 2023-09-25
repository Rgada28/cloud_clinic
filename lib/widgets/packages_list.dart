import 'package:flutter/material.dart';

class PackagesList extends StatefulWidget {
  const PackagesList({super.key, required this.setPackage});

  final Function(String package) setPackage;

  @override
  State<PackagesList> createState() => _PackagesListState();
}

class _PackagesListState extends State<PackagesList> {
  String selectedPackage = "";
  List<String> packages = [
    "Messaging",
    "Voice call",
    "Video Call",
    "In Person"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //TODO Optimize Code increase Resuablitiy
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.message,
                      size: 30,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packages[0],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "\tChat with doctor",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Radio.adaptive(
                    value: packages[0],
                    groupValue: selectedPackage,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        widget.setPackage(value);
                        selectedPackage = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packages[1],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "\tVoice call with doctor",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Radio.adaptive(
                    value: packages[1],
                    groupValue: selectedPackage,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        widget.setPackage(value);
                        selectedPackage = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.video_call,
                      size: 30,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packages[2],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "\tVideo call with doctor",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Radio.adaptive(
                    value: packages[2],
                    groupValue: selectedPackage,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        widget.setPackage(value);
                        selectedPackage = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packages[3],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "\tIn persion with doctor",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Radio.adaptive(
                    value: packages[3],
                    groupValue: selectedPackage,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        widget.setPackage(value);
                        selectedPackage = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
