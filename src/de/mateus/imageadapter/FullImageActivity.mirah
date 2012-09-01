package de.mateus.imageadapter;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;

class FullImageActivity < Activity
  def onCreate(state:Bundle)
    super state
    setContentView(R.layout.full_image)
    
    # get intent data
    the_intent =  getIntent()
    # Selected image id
    position = the_intent.getExtras().getInt("id")
    image_adapter = ImageAdapter.new(self)
    
    image_view = ImageView findViewById(R.id.full_image_view)
    rsrc = int Integer.parseInt(image_adapter.thumb_ids.get(position).toString())
    image_view.setImageResource(rsrc)
  end
end
