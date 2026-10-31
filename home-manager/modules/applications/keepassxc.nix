{
  programs.keepassxc = {
		enable = true;
		settings = {
			Browser = {
				Enabled = true;
			};

			Security = {
				Security_HideNotes = true;
				LockDatabaseIdle = true;
				LockDatabaseIdleSeconds = 120;
				PasswordEmptyPlaceholder = true;
				HideTotpPreviewPanel = true;
				HidePasswordPreviewPanel = true;
				HideNotes = true;
				IconDownloadFallback = true;
			};

			GUI = {
				HidePasswords = true;
				HideUsernames = true;
				ColorPasswords = true;
				ShowTrayIcon = true;
			};
		};
	};
}