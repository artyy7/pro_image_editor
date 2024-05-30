import 'package:pro_image_editor/models/editor_configs/image_generation_configs/processor_configs.dart';

int getNumberOfProcessors({
  required ProcessorConfigs configs,
  required int deviceNumberOfProcessors,
}) {
  switch (configs.processorMode) {
    case ProcessorMode.auto:
      if (deviceNumberOfProcessors <= 4) {
        return deviceNumberOfProcessors - 1;
      } else if (deviceNumberOfProcessors <= 6) {
        return 4;
      } else if (deviceNumberOfProcessors <= 10) {
        return 6;
      } else {
        return 8;
      }
    case ProcessorMode.limit:
      return configs.numberOfBackgroundProcessors;
    case ProcessorMode.maximum:
      // One processor for the main-ui
      return deviceNumberOfProcessors - 1;
    case ProcessorMode.minimum:
      return 1;
  }
}
