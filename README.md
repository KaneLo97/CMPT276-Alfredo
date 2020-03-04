# README

Setup Instructions
1. Clone git repository (i.e., “git clone git@csil-git1.cs.surrey.sfu.ca:mal24/Alfredo.git”).
2. Change directories into the cloned repository (i.e., “cd Alfredo”).
3. Ensure Ruby is installed and that its version is ruby2.3.3p222 or higher (i.e., “ruby -v”). 
4. Ensure Rails is installed and that its version is Rails 5.1.5 or higher (i.e., “rails --version”).
5. Ensure SQLite3 is installed and that its version is 3.8.7.2 or higher (i.e., “sqlite3 --version”).
6. Run “bundle install” to install missing gems.
7. Run “gem uninstall bcrypt” and select “all versions”, if prompted to. Furthermore, if a warning message regarding a devise-4.4.1 dependency appears, disregard and continue with uninstall anyway.
8. Run “gem install bcrypt --platform=ruby”.
9. Run “bin/rails db:migrate RAILS_ENV=development”.
10. Run “rake db:seed”.
11. Run “bin\rails server” to start the local web server.
12. The local web server is now running; open http://localhost:3000/ in web browser to access the web application.