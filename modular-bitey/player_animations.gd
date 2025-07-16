extends Node2D

#note:
#original signal picked for _animation_finished was _on_animation_player_animation_finished
#Changing signal to blank in Node on animation player under signals tab in _aniamtion finished.
#since the connection happens in the _ready() function of this class. 

#new note: Fixed the animation issue by queuing the idle animation in the same function
#for playing the bite animation

#made a flexible play_animation function that will take an animation parameter
#this way for later any additional animations needed the name can be thrown in
#without having to directly call the animation player. 

#same for queue animation so there is no need for searching the method through
#animation player. 

#curr


# variables
var current_animation := "" # for animation helper function
var this_node = ""

func _ready() -> void:
	# return to other stuff
	%AnimationPlayer.connect("animation_finished", Callable(self, "_on_animation_finished"));
	# set this_node to node's name
	this_node == name
	

# ANIMATION HELPER (not sure if working yet?)
#func _on_animation_finished(anim_name):
	#if current_animation == anim_name:
		#current_animation = "";


# HELPER FUNCTION:  play animation only if different
#func change_animation(anim_name: String):
	#%AnimationPlayer.play(anim_name);
	#if current_animation != anim_name:
	#	current_animation = anim_name;

func play_animation(animationName:String):
	%AnimationPlayer.play(animationName);

func play_idle_animation(): 
	# %AnimationPlayer.play("idle")
	play_animation("idle1");

func play_walk_animation():
	# %AnimationPlayer.play("walk")
	play_animation("run2");
	

func play_bite_animation(): #NOT CURRENTLY WORKING! fix it later
	# %AnimationPlayer.play("bite")
	play_animation("bite");
	queue_animation("idle1");
	print_debug("Bite!");
	
func queue_animation(animationName:String):
	%AnimationPlayer.queue(animationName);

func play_test_animation():
	#%AnimationPlayer.play("TEST")
	play_animation("TEST");
	


#func _on_animation_player_animation_finished(anim_name):
#	pass # Replace with function body.
