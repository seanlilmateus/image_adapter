package de.mateus.imageadapter;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.content.Context;


class AndroidGridViewLayoutActivitiy < Activity
  def onCreate(state:Bundle)
    super state
    context = getBaseContext()
    this = self
    
    setContentView(R.layout.grid_layout);
    grid_view = GridView findViewById(R.id.grid_view)
    grid_view.setAdapter(ImageAdapter.new(context))
    
    grid_view.setOnItemClickListener do |parent, view, position, id|
      the_intent = Intent.new(context, FullImageActivity.class)
      the_intent.putExtra("id", position)
      this.startActivity(the_intent)
    end
  end
  
  class ImageClickLister 
    implements OnItemClickListener
    def initialize(context:Context)
      @context = context
    end
    
    def onItemClick(parent:AdapterView, view:View, position:int, id:long)
      # Sending image id to FullScreenActivity
      the_intent = Intent.new(@context, FullImageActivity.class)
      # passing array index
      the_intent.putExtra("id", position)
      @context.startActivity(the_intent)
    end
  end
end