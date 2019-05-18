crumb :root do
  link "Home", root_path
end

crumb :user do |user|
  link "ユーザー詳細", user
  parent :root
end

crumb :skillsheets do
  link "スキルシート一覧", skillsheets_path
end

crumb :skillsheet do |skillsheet|
  link "ユーザー詳細", skillsheet
  parent :skillsheets
end
