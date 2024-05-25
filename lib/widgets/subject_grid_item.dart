import 'package:flutter/material.dart';
import 'package:shcool/model/subject_model.dart';

class SubjectGridItem extends StatelessWidget {
  const SubjectGridItem(
      {super.key, required this.subject, required this.onSelectSubject});

  final SubjectModel subject;
  final void Function() onSelectSubject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectSubject,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              subject.color.withOpacity(0.9),
              subject.color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            subject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
