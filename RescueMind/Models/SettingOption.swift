    struct SettingOption: Identifiable {
        let id = UUID()
        let title: String
        let icon: String?
        let action: () -> Void
    }