crumb :root do
  link 'Home', root_path
end

crumb :users do
  link 'ユーザー一覧', users_path
  parent :root
end

crumb :user do |user|
  link "#{user.name}さんの情報", user
  parent :users
end

crumb :new_user do
  link "新規ユーザー登録", new_user_path
  parent :users
end

crumb :edit_user do |user|
  link user.name, edit_user_path(user)
  parent :users
end

crumb :skillsheets do
  link "スキルシート一覧", skillsheets_path
  parent :root
end

crumb :skillsheet do |skillsheet|
  link "#{skillsheet.user_name}さんのスキルシート", skillsheet
  parent :skillsheets
end

crumb :new_skillsheet do |user|
  link "#{user.name}さんのスキルシート登録", new_skillsheet_path
  parent :skillsheets
end

crumb :edit_skillsheet do |skillsheet|
  link "#{skillsheet.user_name}さんのスキルシート", edit_skillsheet_path(skillsheet)
  parent :skillsheets
end

crumb :new_work_content do |skillsheet|
  link "業務内容の登録", new_work_content_path
  parent :skillsheet, skillsheet
end
