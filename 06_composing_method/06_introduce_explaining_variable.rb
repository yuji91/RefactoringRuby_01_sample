# 6.6 説明用変数の導入
# 複雑な式がある。
# -> 処理の目的を説明するような名前を持つ一時変数に式、または式の一部の結果を代入する。
is_mac_os = platform.upcase.index("MAC")
is_ie_browser = browser.upcase.index("IE")
was_resized = resize > 0
if (is_mac_os && is_ie_browser && initialized? && was_resized)
  # 何かをする
end
