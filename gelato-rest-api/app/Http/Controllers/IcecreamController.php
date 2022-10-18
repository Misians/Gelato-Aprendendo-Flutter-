<?php

namespace App\Http\Controllers;

use App\Models\Icecream;
use Illuminate\Http\Request;

class IcecreamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Icecream::paginate(), 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $fields = $request->all();
        $request->validate([
            'image' => 'required|image|mimes:png,jpg,jpeg|max:2048',
            'name' => 'required'
        ]);

        $imageName = time().'.'.$request->image->extension();

        // Public Folder
        $image = $request->image->move(public_path('images'), $imageName);
        $fields['image'] = 'images/'.$imageName;
        $ice = Icecream::create($fields);
        if(!$ice){
            return response()->json(['error'=>'Ups! There was an error while trying to store the record.']);
        }
        
        return response()->json($ice, 200);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Icecream  $icecream
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $ice = Icecream::find($id);
        if(!$ice){
            return response()->json(['error'=>'Record Not Found!'], 404);
        }
        return response()->json($ice, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Icecream  $icecream
     * @return \Illuminate\Http\Response
     */
    public function edit(Icecream $icecream)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Icecream  $icecream
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        $ice = Icecream::find($id);
        if(!$ice){
            return response()->json(['error'=>'Record Not Found!'], 404);
        }   
        $result = $ice->fill($request->all())->save();
        return response()->json($ice, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Icecream  $icecream
     * @return \Illuminate\Http\Response
     */
    public function destroy(Icecream $icecream)
    {
        $ice = Icecream::find($id);
        if(!$ice){
            return response()->json(['error'=>'Record Not Found!'], 404);
        }
        return response()->json($ice->delete(), 200);
    }
}
