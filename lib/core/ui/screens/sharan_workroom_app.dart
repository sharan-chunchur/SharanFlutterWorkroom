import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/project_model.dart';
import '../widgets/project_card.dart';

class SharanWorkRoomApp extends StatelessWidget {
  const SharanWorkRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/projects/profile.jpg'),
            ),
          ),
        ),
        title: Text(
          'Flutter Workroom',
          style: GoogleFonts.poppins(
            color: const Color(0xff001800),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FlutterLogo(size: 25),
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount:  ProjectModel.listProjects.length,    //ProjectModel.listProjects.length,
        itemBuilder: (context, index) {
          final project = ProjectModel.listProjects[index];
          return ProjectCard(
            project: project,
            index: ProjectModel.listProjects.length - index,
          );
        },
      ),
    );
  }
}