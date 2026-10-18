import 'package:flutter/material.dart';

class AppColors {
  static const canvas= Color(0xFFF8FAF9);

  static const teal50= Color(0xFFF0FDFA);
  static const teal100= Color(0xFFCCFBF1);
  static const teal200= Color(0xFF99F6E4);
  static const teal500= Color(0xFF14B8A6);
  static const teal600= Color(0xFF0D9488);
  static const teal700= Color(0xFF0F766E);
  static const teal900= Color(0xFF134E4A);

  static const slate50= Color(0xFFF8FAFC);
  static const slate100= Color(0xFFF1F5F9);
  static const slate200= Color(0xFFE2E8F0);
  static const slate300= Color(0xFFCBD5E1);
  static const slate400= Color(0xFF94A3B8);
  static const slate500= Color(0xFF64748B);
  static const slate600= Color(0xFF475569);
  static const slate700= Color(0xFF334155);
  static const slate800= Color(0xFF1E293B);
  static const slate900= Color(0xFF0F172A);

  static const rose50= Color(0xFFFFF1F2);
  static const rose100= Color(0xFFFFE4E6);
  static const rose200= Color(0xFFFECDD3);
  static const rose600= Color(0xFFE11D48);
  static const rose700= Color(0xFFBE123C);

  static const amber50= Color(0xFFFFFBEB);
  static const amber100= Color(0xFFFEF3C7);
  static const amber500= Color(0xFFF59E0B);
  static const amber700= Color(0xFFB45309);

  static const violet50= Color(0xFFF5F3FF);
  static const violet100= Color(0xFFEDE9FE);
  static const violet500= Color(0xFF8B5CF6);
  static const violet600= Color(0xFF7C3AED);
  static const violet700= Color(0xFF6D28D9);
}

class AppNavBar extends StatelessWidget implements PreferredSizeWidget{
  final String active;

  const AppNavBar({super.key, this.active=''});

  @override
  Size get preferredSize=>const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.teal900,
      elevation: 0,
      title: const Row(
        children:[
          Icon(Icons.medication_rounded, color: AppColors.teal600, size: 24),
          SizedBox(width: 8),
          Text(
            'MedGuard',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      ),
      actions:[
        IconButton(
          onPressed:(){},
          icon: const Icon(Icons.monitor_heart_outlined, size: 22),
          color: active=='checker'? AppColors.teal700: AppColors.slate500,
        ),
        IconButton(
          onPressed:(){},
          icon: const Icon(Icons.history_rounded, size: 22),
          color: active=='history'? AppColors.teal700: AppColors.slate500,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class SeverityBadge extends StatelessWidget{
  final String level;
  final bool compact;

  const SeverityBadge({super.key,required this.level,this.compact=false});

  @override
  Widget build(BuildContext context) {
    final bool high=level=='High';
    final Color color=high? AppColors.rose700 : AppColors.amber700;
    final Color background=high? AppColors.rose50 : AppColors.amber50;
    final IconData icon=
        high?Icons.gpp_maybe_rounded:Icons.warning_amber_rounded;

    return Container(
      padding:EdgeInsets.symmetric(
        horizontal:compact?9:12,
        vertical:compact?4:6,
      ),
      decoration:BoxDecoration(
        color:background,
        borderRadius:BorderRadius.circular(999),
        border:Border.all(color:color),
      ),
      child:Row(
        mainAxisSize:MainAxisSize.min,
        children:[
          Icon(icon,size:compact?12:14, color:color),
          const SizedBox(width:5),
          Text(
            compact?'$level Risk' : '$level Risk Regimen',
            style:TextStyle(
              fontSize:compact?10.5:12,
              fontWeight:FontWeight.w700,
              color:color,
            ),
          ),
        ],
      ),
    );
  }
}
