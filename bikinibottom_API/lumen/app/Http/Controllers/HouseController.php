<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HouseController extends Controller
{
    public function getAll()
    {
        return response()->json(DB::table('houses')->get());
    }

    public function getOne($id)
    {
        $house = DB::table('houses')
        ->join('owners', 'houses.owner_id', '=', 'owners.id')
        ->select(
            'houses.id',
            'houses.name as house_name',
            'houses.date_built',
            'houses.house_img',
            'owners.name as owner_name',
            'owners.bio',
            'owners.job'
        )
        ->where('houses.id', $id)
        ->first();

        if ($house) {
            return response()->json($house);
        } else {
            return response()->json(['message' => 'Not found'], 404);
        }
    }

    public function getWithOwners()
    {
        $data = DB::table('houses')
            ->join('owners', 'houses.owner_id', '=', 'owners.id')
            ->select('houses.id', 'houses.name as house', 'owners.name as owner', 'houses.date_built', 'houses.house_img')
            ->get();
        return response()->json($data);
    }

    public function save(Request $request)
    {
        DB::table('houses')->insert([
            'name' => $request->input('name'),
            'owner_id' => $request->input('owner_id'),
            'date_built' => $request->input('date_built'),
            'house_img' => $request->input('house_img'),
            'created_at' => now(),
            'updated_at' => now()
        ]);
        return response()->json(['message' => 'House added']);
    }

    public function update($id, Request $request)
    {
        DB::table('houses')->where('id', $id)->update([
            'name' => $request->input('name'),
            'owner_id' => $request->input('owner_id'),
            'date_built' => $request->input('date_built'),
            'house_img' => $request->input('house_img'),
            'updated_at' => now()
        ]);
        return response()->json(['message' => 'House updated']);
    }

    public function delete($id)
    {
        DB::table('houses')->where('id', $id)->delete();
        return response()->json(['message' => 'House deleted']);
    }
}
