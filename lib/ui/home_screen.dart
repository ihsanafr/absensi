import 'package:facerecognation/ui/absen/absen_screen.dart';
import 'package:facerecognation/ui/attend/attend_screen.dart';
import 'package:facerecognation/ui/attendance_history/attendance_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //mengunci tombol back perangkat
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop){
        if(didPop){
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                width: double.infinity,
                color: Color(0xFF567DF5),
                height: 150,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo, Selamat Datang Di', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal,)),
                    Text('Aplikasi Absensi', style: GoogleFonts.poppins(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold )),
                  ],
                ),
                
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 200,
                color: Colors.amber,
                child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()));
                    },
                    child: const Column(
                      children: [
                        Image(image: AssetImage('assets/images/absen.png'),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10,),

                        Text('Absen Kehadiran', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child:  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AbsentScreen()));
                    },
                    child: const Column(
                      children: [
                        Image(image: AssetImage('assets/images/izin.png'),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10,),
                        Text('Cuti / Izin', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  ),
                ),
              Container(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceHistoryScreen()));
                    },
                    child: const Column(
                      children: [
                        Image(image: AssetImage('assets/images/riwayat.png'),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10,),
                        Text('Attendance History', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  ),
                ),
            ],
            )
        )
      ),
    )
  );
    }
}

Future<bool> _onWillPop(BuildContext context) async{
  return (await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("INFO"),
      content: const Text("Are you sure want to exit?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), 
          child: const Text("No"),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: const Text("Yes"),
        )
      ],
    )
    )
  ) ?? false; //jika dialog ditutup tanpa aksi, maka kembalikan nilai false
}