import Log from '@ohos.hilog';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        Log.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Log.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });


    windowStage.getMainWindow()
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    Log.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
