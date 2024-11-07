// lib/features/achievements/widgets/achievement_card.dart
class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final VoidCallback onTap;

  const AchievementCard({
    required this.achievement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconData(
                  int.parse(achievement.icon),
                  fontFamily: 'MaterialIcons',
                ),
                size: 48,
                color: achievement.isUnlocked 
                    ? Theme.of(context).primaryColor 
                    : Colors.grey,
              ),
              SizedBox(height: 8),
              Text(
                achievement.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (!achievement.isUnlocked) ...[
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: achievement.progressCurrent / 
                         achievement.progressTotal,
                ),
                Text(
                  '${achievement.progressCurrent}/${achievement.progressTotal}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}