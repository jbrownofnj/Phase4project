john=User.create!(user_name:"John Brown", color_coefficient:1, user_email:"johnbrownsinbox@gmail.com", password:"IAMTHEONLYJOHNBROWN",admin:true)
cassandra=User.create!(user_name:"Cassandra Cohen", color_coefficient:1, user_email:"cplcohen@gmail.com", password:"firstguestuser")
clean_car=Task.create(task_name:"clean my car",task_description:"That car is filthy man get at it",task_location:"Home",task_contact:"N/A",duration:45,user:john)
orgainize_mail=Task.create(task_name:"orgainize mail",task_description:"go through all the letters",task_location:"Home",task_contact:"N/A",duration:60,user:john)
call_doctor=Task.create(task_name:"Call Doctor",task_description:"set an appointment",task_location:"N/A",task_contact:"Cetrastate",duration:20,user:john)
buy_cat_tree=Task.create(task_name:"Cat Tree",task_description:"Buy a nice cat tree",task_location:"Home",task_contact:"N/A",duration:30,user:john)
clean_car_before_buy_cat_tree=Prereq.create(task:buy_cat_tree,required_task_id:clean_car.id)
call_doctor_before_organize_mail=Prereq.create(task:orgainize_mail,required_task_id:call_doctor.id)
john_can_view_cassandra=ViewPermission.create(user:john,viewable_user:cassandra.id)
johns_friend_code=FriendCode.create(user:john,password:"Mellon")
cassandras_friend_code=FriendCode.create(user:cassandra,password:"Seaweed")
beach_weekend_for_john=Event.create(user:john, event_name:"Beach Weekend", event_description:"Long weekend with the family",event_location:"NJ shore", event_contact:"Jean Brown", event_start: DateTime.parse("5 June 2022"),event_end: DateTime.parse("8 June 2022") )
dnd_for_john=Event.create(user:john, event_name:"Dnd", event_description:"Game ON!",event_location:"Kendras place", event_contact:"Kendra", event_start: DateTime.parse("10 June 2022 15:00"),event_end: DateTime.parse("10 June 2022 21:00") )
clean_car_before_beach=Preperation.create(event:beach_weekend_for_john, event_task_preperation_id:clean_car.id)
puts "YOU SEEDED! WOO"

