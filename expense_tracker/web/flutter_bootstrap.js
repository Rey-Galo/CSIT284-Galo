{{flutter_js}}
{{flutter_build_config}}

const isMicrosoftEdge =
  navigator.userAgent.includes('Edg/') ||
  navigator.userAgent.includes('Edge/');

_flutter.loader.load({
  config: {
    canvasKitForceCpuOnly: isMicrosoftEdge,
  },
});
