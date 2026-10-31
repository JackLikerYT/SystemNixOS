{ pkgs, ...}:

{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
			wlrobs
			obs-backgroundremoval
			obs-pipewire-audio-capture
			obs-vaapi
			obs-gstreamer
			obs-vkcapture
			obs-move-transition
			obs-multi-rtmp
			obs-pipewire-audio-capture
			obs-wayland-hotkeys
			input-overlay
    ];
  };
}
