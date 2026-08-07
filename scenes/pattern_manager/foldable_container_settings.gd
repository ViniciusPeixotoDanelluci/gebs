class_name SettingsContainer
extends FoldableContainer

@warning_ignore_start("unused_signal")
signal property_changed(property_name: String, new_value: Variant, _source: Control)
signal get_property(property_name: String, source: Control)

"""
	This Script is the connector between all the property LineEdits, Sliders, CheckButtons 
	and OptionButton to the PatternManager Parent.
	
	You can save and use this node has its own scene if you wish to completely decouple it.
"""
